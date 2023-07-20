using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]
    public class CategoryController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public CategoryController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Category> categories = await _appDbContext.Categories.ToListAsync();

            return View(model: categories);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Category model)
        {
            await _appDbContext.Categories.AddAsync(model);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "Category");
        }

        public async Task<IActionResult> Edit(int id)
        {
            Category category = await _appDbContext.Categories.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            return View(model: category);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(BanType banType)
        {
            Category category = await _appDbContext.Categories.FirstOrDefaultAsync(n => n.Id == banType.Id)
                ?? throw new NullReferenceException();

            category.Name = banType.Name;

            _appDbContext.Categories.Update(category);
            await _appDbContext.SaveChangesAsync();


            return RedirectToAction(nameof(Index), "Category");
        }

        public async Task<IActionResult> Delete(int id)
        {
            Category category = await _appDbContext.Categories.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            _appDbContext.Categories.Remove(category);
            _appDbContext.SaveChanges();

            return RedirectToAction(nameof(Index), "Category");
        }
    }
}
