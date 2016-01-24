namespace XShare.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    public class Feature
    {
        public int Id { get; set; }

        private ICollection<Car> cars;

        public Feature()
        {
            this.cars = new HashSet<Car>();
        }

        [Required]
        public string Description { get; set; }

        public virtual ICollection<Car> Cars
        {
            get { return this.cars; }
            set { this.cars = value; }
        }
    }
}
