﻿namespace Backend.Models
{
    public class CarColor : BaseEntity
    {
        public int CarId { get; set; }
        public Car? Car { get; set; }
        public int ColorId { get; set; }
        public Color? Color { get; set; }
    }
}
