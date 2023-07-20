namespace Backend.Models
{
    public class Transmission : BaseEntity
    {
        public string? Name { get; set; }
        public ICollection<Car>? Cars { get; set; }
    }
}
