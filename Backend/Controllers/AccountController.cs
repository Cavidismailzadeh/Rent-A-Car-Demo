using Backend.Helpers.Enums;
using Backend.Models;
using Backend.Services.Interfaces;
using Backend.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly IEmailService _emailService;
        private readonly IFileService _fileService;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public AccountController(UserManager<AppUser> userManager, RoleManager<IdentityRole> roleManager, SignInManager<AppUser> signInManager, IEmailService emailService, IFileService fileService, IWebHostEnvironment webHostEnvironment)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _signInManager = signInManager;
            _emailService = emailService;
            _fileService = fileService;
            _webHostEnvironment = webHostEnvironment;
        }


        [HttpGet(nameof(Register))]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost(nameof(Register))]
        public async Task<IActionResult> Register(RegisterVM registerVM)
        {
            if (User.Identity.IsAuthenticated)
            {
                return Json("Ok");
            }

            if (!ModelState.IsValid)
            {
                return View(registerVM);
            }

            AppUser appUser = new();

            appUser.FullName = registerVM.Firstname + registerVM.Lastname;
            appUser.Email = registerVM.Email;
            appUser.UserName = registerVM.Username;

            var result = await _userManager.CreateAsync(appUser, registerVM.Password);

            if (!result.Succeeded)
            {
                foreach (var item in result.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                };
                return View(registerVM);
            };

            var roleResult = await _userManager.AddToRoleAsync(appUser, Roles.Member.ToString());

            if (!roleResult.Succeeded)
            {
                foreach (var item in roleResult.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                };
                return View(registerVM);
            };

            var token = await _userManager.GenerateEmailConfirmationTokenAsync(appUser);
            var confirmationLink = Url.Action("ConfirmEmail", "Account", new { token, username = appUser.UserName }, HttpContext.Request.Scheme);

            SendEmail(appUser.Email, confirmationLink);

            return RedirectToAction("Index", controllerName: "Home");

        }

        [HttpGet(nameof(Login))]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost(nameof(Login))]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            if (User.Identity.IsAuthenticated)
            {
                return Json("Ok");
            }

            if (!ModelState.IsValid)
            {
                return View(loginVM);
            }

            AppUser appUser = await _userManager.FindByNameAsync(loginVM.Username);

            if (appUser is null)
            {
                ModelState.AddModelError("", "Username not found!");
                return View(loginVM);
            }

            var result = await _signInManager.PasswordSignInAsync(appUser, loginVM.Password, loginVM.RememberMe, true);

            if (result.IsNotAllowed)
            {
                ModelState.AddModelError("", "Please confirm your account!");
                return View(loginVM);
            }

            if (result.IsLockedOut)
            {
                ModelState.AddModelError("", "Your profile has been locked!\nPlease try later!");
                return View(loginVM);
            }

            if (!result.Succeeded)
            {
                ModelState.AddModelError("", "Username not found!");
                return View(loginVM);
            }

            if (await _userManager.IsInRoleAsync(appUser, Roles.Admin.ToString()))
            {
                return RedirectToAction("Index", controllerName: "Dashboard", new { area = "Admin" });
            }


            return RedirectToAction("Index", controllerName: "Home");
        }

        public async Task<ActionResult> LogOut()
        {
            if (User.Identity.IsAuthenticated)
            {
                await _signInManager.SignOutAsync();
            }

            return RedirectToAction("Index", controllerName: "Home");
        }

        public IActionResult SendEmail(string userEmail, string confirmationLink)
        {
            string subject = "Confirm you email";
            string webRootPath = _webHostEnvironment.WebRootPath;
            string filePath = Path.Combine(webRootPath, "assets/templates/verify.html");
            string fileContent = System.IO.File.ReadAllText(filePath);
            string body = fileContent.Replace("{{link}}", confirmationLink);

            try
            {
                _emailService.Send(userEmail, subject, body);
            }
            catch (Exception)
            {
                throw;
            }

            return Json("Ok");
        }

        public async Task CreateRoles()
        {
            foreach (var item in Enum.GetValues(typeof(Roles)))
            {
                if (!await _roleManager.RoleExistsAsync(item.ToString()))
                {
                    await _roleManager.CreateAsync(new IdentityRole(item.ToString()));
                }
            }
        }

        public async Task<IActionResult> ConfirmEmail(string username, string token)
        {
            AppUser appUser = await _userManager.FindByNameAsync(username);

            if (appUser is null)
            {
                return Json("User could not Found");
            }

            var result = await _userManager.ConfirmEmailAsync(appUser, token);

            if (!result.Succeeded)
            {
                return Json("Your token is invalid");
            }

            return RedirectToAction("Index", controllerName: "Home");
        }

        [HttpGet]
        public IActionResult ForgetPassword()
        {
            return View();
        }
        public IActionResult VerifyEmail()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ForgetPassword(ForgetPasswordVM forgetPasswordVM)
        {
            if (!ModelState.IsValid)
            {
                return View(forgetPasswordVM);
            }

            AppUser existUser = await _userManager.FindByEmailAsync(forgetPasswordVM.Email);

            if (existUser is null)
            {
                ModelState.AddModelError("Email", "User not found!");

                return View();
            }

            string token = await _userManager.GeneratePasswordResetTokenAsync(existUser);

            string link = Url.Action(nameof(ResetPassword), "Account", new { userId = existUser.Id, token },
                Request.Scheme, Request.Host.ToString());

            string path = "wwwroot/assets/templates/verify.html";
            string body = string.Empty;
            string subject = "Confirm Email for reset Password";

            body = _fileService.ReadFile(path, body);

            body = body.Replace("{{link}}", link);
            body = body.Replace("{{name}}", existUser.FullName);
            body = body.Replace("{{surname}}", existUser.UserName);

            _emailService.Send(existUser.Email, subject, body);

            return RedirectToAction(nameof(VerifyEmail));
        }

        [HttpGet]
        public IActionResult ResetPassword(string userId, string token)
        {
            return View(new ResetPasswordVM { Token = token, UserId = userId });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResetPassword(ResetPasswordVM resetPasswordVM)
        {
            if (!ModelState.IsValid)
            {
                return View(resetPasswordVM);
            }

            AppUser existUser = await _userManager.FindByIdAsync(resetPasswordVM.UserId);

            if (existUser is null)
            {
                return NotFound();
            }

            if (await _userManager.CheckPasswordAsync(existUser, resetPasswordVM.Password))
            {
                ModelState.AddModelError("", "This password already exist!");

                return View(resetPasswordVM);
            }


            await _userManager.ResetPasswordAsync(existUser, resetPasswordVM.Token, resetPasswordVM.Password);

            return RedirectToAction(nameof(Login));
        }

    }

}
