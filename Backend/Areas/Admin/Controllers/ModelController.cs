using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{

    [Area("admin")]

    public class ModelController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public ModelController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Model> models = await _appDbContext.Models.ToListAsync();
            return View(model: models);
        }
        public async Task<IActionResult> Create()
        {
            IEnumerable<Brand> brands = await _appDbContext.Brands.ToListAsync();

            ViewBag.Brands = brands;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Model model)
        {
            await _appDbContext.Models.AddAsync(model);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "Model");
        }
        public async Task<IActionResult> Edit(int id)
        {
            Model model = await _appDbContext.Models.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            return View(model: model);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Model model)
        {
              Model modelDb = await _appDbContext.Models.FirstOrDefaultAsync(n => n.Id == model.Id)
                ?? throw new NullReferenceException();

            modelDb.Name = model.Name;

            _appDbContext.Models.Update(modelDb);
            await _appDbContext.SaveChangesAsync();


            return RedirectToAction(nameof(Index), "Model");
        }

        public async Task<IActionResult> Delete(int id)
        {
            Model model = await _appDbContext.Models.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            _appDbContext.Models.Remove(model);
            _appDbContext.SaveChanges();
            return RedirectToAction(nameof(Index), "Model");

        }
    }
}
