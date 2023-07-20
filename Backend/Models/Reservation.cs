namespace Backend.Models
{
    public class Reservation : BaseEntity
    {
        public string? AppUserId { get; set; }
        public AppUser? AppUser { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int? CarId { get; set; }
        public Car? Car { get; set; }
    }
}
