namespace Backend.Models;

public class City : BaseEntity
{
    public string? Name { get; set; }
    public ICollection<Car>? Cars { get; set; }
}
