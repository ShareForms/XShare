namespace XShare.Data.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class Reservation
    {
        [Key]
        public int Id { get; set; }

        public string From { get; set; }

        public string To { get; set; }

        public DateTime FromTime { get; set; }

        public DateTime ToTime { get; set; }
        
        public int CarId { get; set; }

        public virtual Car Car { get; set; }

        public string UserId { get; set; }

        public virtual User User { get; set; }
    }
}
