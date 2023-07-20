using System.ComponentModel.DataAnnotations;

namespace Backend.ViewModels
{
    public class RegisterVM
    {
        [Required, MaxLength(50)]
        public string Firstname { get; set; }

        [Required, MaxLength(50)]
        public string Lastname { get; set; }

        [Required, MaxLength(100), DataType(DataType.EmailAddress, ErrorMessage = "E-mail is not valid")]
        public string Email { get; set; }

        [Required, MaxLength(50)]
        public string Username { get; set; }

        [Required, MaxLength(50), DataType(DataType.Password)]
        public string Password { get; set; }

        [Required, MaxLength(50), DataType(DataType.Password), Compare(nameof(Password))]
        public string ConfirmPassword { get; set; }
    }
}
