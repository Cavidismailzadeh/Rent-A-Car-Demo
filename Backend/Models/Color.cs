namespace Backend.Models
{
    public class Color : BaseEntity
    {
        public string? Name { get; set; }
        public ICollection<CarColor>? CarColors { get; set; }
    }
}
