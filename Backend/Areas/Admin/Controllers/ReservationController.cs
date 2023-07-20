using Backend.DATA;
using Backend.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Backend.Areas.Admin.Controllers
{
    [Area("admin")]
    public class ReservationController : Controller
    {
        private readonly AppDbContext _appDbContext;

        public ReservationController(AppDbContext appDbContext)
        {
            _appDbContext = appDbContext;
        }

        public async Task<IActionResult> Index()
        {
            IEnumerable<Reservation> reservations =
                await _appDbContext.Reservations
                .Include(n => n.AppUser)
                .Include(n => n.Car)
                .ThenInclude(n => n.Brand)
                .ToListAsync();

            return View(model: reservations);
        }

        public async Task<IActionResult> Delete(int id)
        {
            Reservation reservation = await _appDbContext.Reservations.FirstOrDefaultAsync(n => n.Id == id)
                ?? throw new NullReferenceException();

            _appDbContext.Reservations.Remove(reservation);
            await _appDbContext.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
    }
}
