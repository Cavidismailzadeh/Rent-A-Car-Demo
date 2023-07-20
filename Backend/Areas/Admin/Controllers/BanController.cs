using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]
    public class BanController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public BanController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<BanType> banTypes = await _appDbContext.BanTypes.ToListAsync();

            return View(model: banTypes);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(BanType model)
        {
            await _appDbContext.BanTypes.AddAsync(model);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index), "Ban");
        }

        public async Task<IActionResult> Edit(int id)
        {
            BanType banType = await _appDbContext.BanTypes.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            return View(model: banType);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(BanType banType)
        {
            BanType banTypeDb = await _appDbContext.BanTypes.FirstOrDefaultAsync(n => n.Id == banType.Id)
                ?? throw new NullReferenceException();

            banTypeDb.Name = banType.Name;

            _appDbContext.BanTypes.Update(banTypeDb);
            await _appDbContext.SaveChangesAsync();


            return RedirectToAction(nameof(Index), "Ban");
        }

        public async Task<IActionResult> Delete(int id)
        {
            BanType banType = await _appDbContext.BanTypes.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();
            _appDbContext.BanTypes.Remove(banType);
            _appDbContext.SaveChanges();

            return RedirectToAction(nameof(Index), "Ban");
        }
    }
}
