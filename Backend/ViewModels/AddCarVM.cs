using Backend.Models;

namespace Backend.ViewModels;

public class AddCarVM
{
    public Car Car { get; set; }
    public IFormFile MainImage { get; set; }
    public List<IFormFile> OtherImages { get; set; }
}
