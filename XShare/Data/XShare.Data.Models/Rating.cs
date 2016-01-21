namespace XShare.Data.Models
{
    using System.ComponentModel.DataAnnotations;
    using XShare.Common.Constants;

    public class Rating
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Range(ModelConstants.MinRating, ModelConstants.MaxRating)]
        public int Value { get; set; }

        public int CarId { get; set; }

        public virtual Car Car { get; set; }
    }    
}
