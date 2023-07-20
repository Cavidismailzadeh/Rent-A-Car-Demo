using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]
    public class BrandController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public BrandController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Brand> brands = await _appDbContext.Brands.ToListAsync();
            return View(model: brands);
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Brand model)
        {
            await _appDbContext.Brands.AddAsync(model);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "Brand");
        }
        public async Task<IActionResult> Edit(int id)
        {
            Brand brand = await _appDbContext.Brands.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            return View(model: brand);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Brand brand)
        {
            Brand brandDb = await _appDbContext.Brands.FirstOrDefaultAsync(n => n.Id == brand.Id)
                ?? throw new NullReferenceException();

            brandDb.Name = brand.Name;

            _appDbContext.Brands.Update(brandDb);
            await _appDbContext.SaveChangesAsync();


            return RedirectToAction(nameof(Index), "Brand");
        }

        public async Task<IActionResult> Delete(int id)
        {
            Brand brand = await _appDbContext.Brands.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            _appDbContext.Brands.Remove(brand);
            _appDbContext.SaveChanges();
            return RedirectToAction(nameof(Index), "Brand");

        }
    }
}
