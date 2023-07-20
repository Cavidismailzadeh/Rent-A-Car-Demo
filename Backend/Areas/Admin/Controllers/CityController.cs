using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]

    public class CityController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public CityController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<City> cities = await _appDbContext.Cities.ToListAsync();
            return View(model: cities);
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(City model)
        {
            await _appDbContext.Cities.AddAsync(model);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "City");
        }

        public async Task<IActionResult> Edit(int id)
        {
            City city = await _appDbContext.Cities.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            return View(model: city);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(City city)
        {
            City cityDb = await _appDbContext.Cities.FirstOrDefaultAsync(n => n.Id == city.Id)
                ?? throw new NullReferenceException();

            cityDb.Name = city.Name;

            _appDbContext.Cities.Update(cityDb);
            await _appDbContext.SaveChangesAsync();


            return RedirectToAction(nameof(Index), "City");
        }

        public async Task<IActionResult> Delete(int id)
        {
            City city = await _appDbContext.Cities.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            _appDbContext.Cities.Remove(city);
            _appDbContext.SaveChanges();

            return RedirectToAction(nameof(Index), "City");

        }
    }
}
