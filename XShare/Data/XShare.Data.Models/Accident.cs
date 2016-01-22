namespace XShare.Data.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using XShare.Common.Constants;

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
