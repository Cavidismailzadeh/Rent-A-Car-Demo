using Microsoft.AspNetCore.Identity;

namespace Backend.Models
{
    public class AppUser : IdentityUser
    {
        public string? FullName { get; set; }
        public ICollection<Car> Cars { get; set; }
    }
}
