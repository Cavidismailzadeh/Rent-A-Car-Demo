namespace Backend.Models
{
    public class BanType : BaseEntity
    {
        public string? Name { get; set; }
        public ICollection<Car>? Cars { get; set; }
    }
}
