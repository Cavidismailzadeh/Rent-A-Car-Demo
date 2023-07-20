using Backend.DATA;
using Backend.Helpers;
using Backend.Models;
using Backend.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Controllers
{
    public class CarController : Controller
    {
        private readonly AppDbContext _appDbContext;
        private readonly UserManager<AppUser> _userManager;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public CarController(AppDbContext appDbContext, UserManager<AppUser> userManager, IWebHostEnvironment webHostEnvironment)
        {
            _appDbContext = appDbContext;
            _userManager = userManager;
            _webHostEnvironment = webHostEnvironment;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Car> cars = await _appDbContext.Cars
                .Where(m => !m.IsDeleted)
                .Include(m => m.Category)
                .Include(m => m.Brand.Models)
                .Include(m => m.Brand)
                .ThenInclude(m => m.Models)
                .Include(m => m.CarImages)
                .Include(m => m.GearBox)
                .Include(m => m.FuelType)
                .Include(m => m.BanType)
               
                .ToListAsync();

            CarVM model = new();
            model.Cars = cars;

            return View(model);
        }

        public async Task<IActionResult> GetAll(int id)
        {
            IEnumerable<Car> cars = await _appDbContext.Cars
                .Where(m => !m.IsDeleted && m.CategoryId == id)
                .Include(m => m.Category)
                .Include(m => m.Brand.Models)
                .Include(m => m.Brand)
                .ThenInclude(m => m.Models)
                .Include(m => m.CarImages)
                .Include(m => m.GearBox)
                .Include(m => m.FuelType)
                .Include(m => m.BanType)
                .Take(4)
                .ToListAsync();

            CarVM model = new();
            model.Cars = cars;

            return View(model);
        }
        public async Task<IActionResult> Detail(int id)
        {
            Car car = await _appDbContext.Cars
           .Where(m => !m.IsDeleted && m.Id == id)
           .Include(m => m.Category)
           .Include(m => m.Brand.Models)
           .Include(m => m.Brand)
           .ThenInclude(m => m.Models)
           .Include(m => m.CarImages)
           .Include(m => m.GearBox)
           .Include(m => m.FuelType)
           .Include(m => m.BanType)
           .Include(m => m.City)
           .Include(m => m.AppUser)
           .FirstOrDefaultAsync();


            return View(model: car);
        }

        public async Task<IActionResult> AddCar()
        {
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Login", "Account");
            }

            List<Brand> brands = await _appDbContext.Brands.ToListAsync();
            List<Model> models = await _appDbContext.Models.ToListAsync();
            List<FuelType> fuelTypes = await _appDbContext.FuelTypes.ToListAsync();
            List<City> cities = await _appDbContext.Cities.ToListAsync();
            List<BanType> banTypes = await _appDbContext.BanTypes.ToListAsync();
            List<GearBox> gearBoxes = await _appDbContext.GearBoxes.ToListAsync();
            List<Category> categories = await _appDbContext.Categories.ToListAsync();
            List<Transmission> transmissions = await _appDbContext.Transmissions.ToListAsync();

            ViewBag.Brands = brands;
            ViewBag.Models = models;
            ViewBag.FuelTypes = fuelTypes;
            ViewBag.Cities = cities;
            ViewBag.BanTypes = banTypes;
            ViewBag.GearBoxes = gearBoxes;
            ViewBag.Categories = categories;
            ViewBag.Transmissions = transmissions;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddCar(AddCarVM model)
        {
            await Helper.SaveFile(Path.Combine(_webHostEnvironment.WebRootPath, "assets", "image", model.MainImage.FileName), model.MainImage);
            model.Car.CarImages.Add(new CarImage
            {
                Name = model.MainImage.FileName,
                IsDeleted = false,
                IsMain = true
            });
            model.Car.AppUser = await _userManager.Users.FirstOrDefaultAsync(n => n.UserName == User.Identity.Name);
            await _appDbContext.Cars.AddAsync(model.Car);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "Home");
        }

        [HttpPost]
        public async Task<IActionResult> Reservation(int id, DateTime startDate, DateTime endDate)
        {
            if (!User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Login", "Account");
            }

            AppUser user = await _userManager.Users.FirstOrDefaultAsync(n => n.UserName == User.Identity.Name);
            Car car = await _appDbContext.Cars.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            Reservation reservation = new()
            {
                StartDate = startDate,
                EndDate = endDate,
                Car = car,
                CarId = car.Id,
                AppUser = user,
                AppUserId = user.Id
            };

            await _appDbContext.Reservations.AddAsync(reservation);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "Home");
        }
    }
}
