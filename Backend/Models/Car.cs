namespace Backend.Models
{
    public class Car : BaseEntity
    {
        public Car()
        {
            CarImages = new HashSet<CarImage>();
            Reservations = new HashSet<Reservation>();
        }

        public double Price { get; set; }
        public double Mileage { get; set; }
        public DateTime Year { get; set; }
        public int CategoryId { get; set; }
        public Category? Category { get; set; }
        public int BrandId { get; set; }
        public Brand? Brand { get; set; }
        public int? ModelId { get; set; }
        public Model? Model { get; set; }
        public int? CityId { get; set; }
        public City? City { get; set; }
        public int FuelTypeId { get; set; }
        public FuelType? FuelType { get; set; }
        public int TransmissionId { get; set; }
        public Transmission? Transmission { get; set; }
        public int BanTypeId { get; set; }
        public BanType? BanType { get; set; }
        public int GearBoxId { get; set; }
        public GearBox? GearBox { get; set; }
        public string? AppUserId { get; set; }
        public AppUser? AppUser { get; set; }
        public ICollection<CarImage>? CarImages { get; set; }
        public ICollection<CarColor>? CarColors { get; set; }
        public ICollection<CarSituation>? CarSituations { get; set; }
        public ICollection<Reservation>? Reservations { get; set; }
    }
}
