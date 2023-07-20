using Backend.DATA;
using Backend.Models;
using Backend.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]
    public class CarController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public CarController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
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

        public async Task<IActionResult> Delete(int id)
        {
            Car car = await _appDbContext.Cars.FirstOrDefaultAsync(m => m.Id == id)
                ?? throw new NullReferenceException();

            _appDbContext.Cars.Remove(car);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
