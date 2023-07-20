namespace Backend.Models
{
    public class CarImage : BaseEntity
    {
        public string? Name { get; set; }
        public bool IsMain { get; set; }
        public int CarId { get; set; }
        public Car? Car { get; set; }
    }
}
