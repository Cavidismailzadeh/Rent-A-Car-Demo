using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]

    public class FuelController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public FuelController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<FuelType> fuelTypes = await _appDbContext.FuelTypes.ToListAsync();
            return View(model: fuelTypes);
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(FuelType model)
        {
            await _appDbContext.FuelTypes.AddAsync(model);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "Fuel");
        }


        public async Task<IActionResult> Edit(int id)
        {
            FuelType fuelType = await _appDbContext.FuelTypes.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            return View(model: fuelType);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(FuelType fuelType)
        {
            FuelType fuelTypeDb = await _appDbContext.FuelTypes.FirstOrDefaultAsync(n => n.Id == fuelType.Id)
                ?? throw new NullReferenceException();

            fuelTypeDb.Name = fuelType.Name;

            _appDbContext.FuelTypes.Update(fuelTypeDb);
            await _appDbContext.SaveChangesAsync();


            return RedirectToAction(nameof(Index), "Fuel");
        }

        public async Task<IActionResult> Delete(int id)
        {
            FuelType fuelType = await _appDbContext.FuelTypes.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            _appDbContext.FuelTypes.Remove(fuelType);
            _appDbContext.SaveChanges();

            return RedirectToAction(nameof(Index), "Fuel");

        }
    }
}
