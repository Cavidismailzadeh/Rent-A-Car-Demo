namespace Backend.Models
{
    public class Situation : BaseEntity
    {
        public string? Name { get; set; }
        public ICollection<CarSituation>? CarSituations { get; set; }
    }
}
