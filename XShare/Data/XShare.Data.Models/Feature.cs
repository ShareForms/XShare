namespace XShare.Data.Models
{
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Feature
    {
        private ICollection<Car> cars;
        public Feature()
        {
            this.cars = new HashSet<Car>();
        }

        [Key]
        public int Id { get; set; }

        [Required]
        public string Value { get; set; }

        public virtual ICollection<Car> Cars
        {
            get { return this.cars; }
            set { this.cars = value; }
        }
    }
}