using Backend.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Backend.DATA
{
    public class AppDbContext : IdentityDbContext<AppUser>
    {
        public AppDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Setting> Settings { get; set; }
        public DbSet<Car> Cars { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<CarImage> CarImages { get; set; }
        public DbSet<Brand> Brands { get; set; }
        public DbSet<Model> Models { get; set; }
        public DbSet<FuelType> FuelTypes { get; set; }
        public DbSet<Transmission> Transmissions { get; set; }
        public DbSet<BanType> BanTypes { get; set; }
        public DbSet<GearBox> GearBoxes { get; set; }
        public DbSet<Color> Colors { get; set; }
        public DbSet<Situation> Situations { get; set; }
        public DbSet<CarColor> CarColors { get; set; }
        public DbSet<CarSituation> CarSituations { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Reservation> Reservations { get; set; }

    }
}
