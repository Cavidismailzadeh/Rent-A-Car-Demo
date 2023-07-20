namespace Backend.Models
{
    public class FuelType : BaseEntity
    {
        public string? Name { get; set; }
        public ICollection<Car>? Car { get; set; }
    }
}
