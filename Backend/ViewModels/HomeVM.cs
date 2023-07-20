using Backend.Models;

namespace Backend.ViewModels
{
    public class HomeVM
    {
        public IEnumerable<Car>? Cars { get; set; }
    }
}
