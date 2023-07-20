namespace Backend.Models
{
    public class CarSituation : BaseEntity
    {
        public int CarId { get; set; }
        public Car? Car { get; set; }
        public int SituationId { get; set; }
        public Situation? Situation { get; set; }
    }
}
