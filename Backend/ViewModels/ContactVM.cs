using System.ComponentModel.DataAnnotations;

namespace Backend.ViewModels
{
    public class ContactVM
    {
        [Required, MaxLength(50)]
        public string Fullname { get; set; } = null!;
        [Required, MaxLength(50)]
        public string PhoneNumber { get; set; } = null!;
        [Required, MaxLength(250)]
        public string Message { get; set; } = null!;
    }
}
