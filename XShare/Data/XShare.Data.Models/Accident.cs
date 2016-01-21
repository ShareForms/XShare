using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using XShare.Common.Constants;

namespace XShare.Data.Models
{
    public class Accident
    {
        public int Id { get; set; }

        public string Location { get; set; }

        [Required]
        public DateTime Date { get; set; }

        [Required]
        [MaxLength(ModelConstants.MaxDescriptionLength)]
        public string Description { get; set; }

        public virtual Car Car { get; set; }

        public virtual User User { get; set; }
    }
}
