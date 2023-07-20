namespace Backend.Models
{
    public class GearBox : BaseEntity
    {
        public string? Name { get; set; }
        public ICollection<Car>? Cars { get; set; }
    }
}
