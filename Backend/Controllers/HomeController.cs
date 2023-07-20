using Backend.DATA;
using Backend.Models;
using Backend.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public HomeController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Car> cars = await _appDbContext.Cars
                .Where(m => !m.IsDeleted)
                .Include(m => m.Category)
                .Include(m => m.Brand)
                .ThenInclude(m => m.Models)
                .Include(m => m.CarImages)
                .Include(m => m.GearBox)
                .Include(m => m.FuelType)
                .Include(m => m.Model)
                .Include(m => m.City)
                .Take(12)
                .ToListAsync();

            HomeVM model = new();
            model.Cars = cars;

            return View(model);
        }

        public async Task<IActionResult> MainSearch(string searchText)
        {
            if (searchText == null)
            {
                return RedirectToAction(nameof(Index));
            }

            IEnumerable<Car> car = await _appDbContext.Cars
                .Include(m => m.Category)
                .Include(m => m.Brand)
                .ThenInclude(m => m.Models)
                .Include(m => m.CarImages)
                .Include(m => m.GearBox)
                .Include(m => m.FuelType)
                .Include(m => m.Model)
                .Include(m => m.City)
                .OrderByDescending(m =>m.Id)
                .Where(m => !m.IsDeleted && m.Brand.Name.ToLower().Trim().Contains(searchText.ToLower().Trim())).Take(4).ToListAsync();

            return View(car);
        }
    }
}