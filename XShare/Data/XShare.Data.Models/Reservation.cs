namespace XShare.Data.Models
{
    using System;

    public class Reservation
    {
        public int Id { get; set; }

        public string From { get; set; }

        public string To { get; set; }

        public DateTime Date { get; set; }

        public virtual Car Car { get; set; }
    }
}
