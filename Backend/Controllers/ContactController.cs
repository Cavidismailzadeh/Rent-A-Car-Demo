using Backend.Services.Interfaces;
using Backend.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    public class ContactController : Controller
    {
        private readonly IEmailService _emailService;

        public ContactController(IEmailService emailService)
        {
            _emailService = emailService;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(ContactVM model)
        {
            string adminAddress = "javidai@code.edu.az";
            string subject = "Support";
            string body = $"<h4>Fullname: {model.Fullname}</h4>" +
                $"<h4>Phone: {model.PhoneNumber}</h4>" +
                $"<p>Message: {model.Message}</h4>";

            try
            {
                _emailService.Send(adminAddress, subject, body);
            }
            catch (Exception)
            {
                throw;
            }

            return RedirectToAction(nameof(Index), "Home");
        }
    }
}

