namespace Backend.Models
{
    public class Brand : BaseEntity
    {
        public string? Name { get; set; }
        public ICollection<Model>? Models { get; set; }
    }
}
