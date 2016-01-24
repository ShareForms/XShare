namespace XShare.Data.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using XShare.Common.Constants;

    public class Car
    {
        private ICollection<Rating> ratings;
        private ICollection<Feature> features;
        private ICollection<Accident> accidents;
        private ICollection<Reservation> reservations;

        public Car()
        {
            this.ratings = new HashSet<Rating>();
            this.accidents = new HashSet<Accident>();
            this.features = new HashSet<Feature>();
            this.reservations = new HashSet<Reservation>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        [MaxLength(ModelConstants.MaxDescriptionLength)]
        public string Description { get; set; }

        [Range(ModelConstants.MinFuel, ModelConstants.MaxFuel)]
        public double FuelEconomy { get; set; }

        [Required]
        public string PictureUrl { get; set; }

        public ICollection<Feature> Features { get; set; }

        public CarTypes CarType { get; set; }

        public virtual ICollection<Rating> Ratings
        {
            get { return this.ratings; }
            set { this.ratings = value; }
        }

        public virtual ICollection<Accident> Accidents
        {
            get { return this.accidents; }
            set { this.accidents = value; }
        }

        public virtual ICollection<Reservation> Reservations
        {
            get { return this.reservations; }
            set { this.reservations = value; }
        }
    }
}
