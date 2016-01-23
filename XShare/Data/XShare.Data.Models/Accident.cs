namespace XShare.Data.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using XShare.Common.Constants;

    public class Accident
    {
        [Key]
        public int Id { get; set; }

        public string Location { get; set; }

        [Required]
        public string Picture { get; set; }

        [Required]
        public DateTime Date { get; set; }

        [Required]
        [MaxLength(ModelConstants.MaxDescriptionLength)]
        public string Description { get; set; }

        public int CarId { get; set; }

        public virtual Car Car { get; set; }

        public string UserId { get; set; }

        public virtual User User { get; set; }
    }
}
