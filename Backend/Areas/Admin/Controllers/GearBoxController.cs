using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]

    public class GearBoxController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public GearBoxController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<GearBox> gearBoxes = await _appDbContext.GearBoxes.ToListAsync();
            return View(model: gearBoxes);
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(GearBox model)
        {
            await _appDbContext.GearBoxes.AddAsync(model);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "GearBox");
        }

        public async Task<IActionResult> Edit(int id)
        {
            GearBox gearBox = await _appDbContext.GearBoxes.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            return View(model: gearBox);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(GearBox gearBox)
        {
            GearBox gearBoxDb = await _appDbContext.GearBoxes.FirstOrDefaultAsync(n => n.Id == gearBox.Id)
                ?? throw new NullReferenceException();

            gearBoxDb.Name = gearBox.Name;

            _appDbContext.GearBoxes.Update(gearBoxDb);
            await _appDbContext.SaveChangesAsync();


            return RedirectToAction(nameof(Index), "GearBox");
        }

        public async Task<IActionResult> Delete(int id)
        {
            GearBox gearBox = await _appDbContext.GearBoxes.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            _appDbContext.GearBoxes.Remove(gearBox);
            _appDbContext.SaveChanges();

            return RedirectToAction(nameof(Index), "GearBox");

        }
    }
}
