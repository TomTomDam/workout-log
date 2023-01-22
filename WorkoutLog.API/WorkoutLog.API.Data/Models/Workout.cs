using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class Workout : Entity
    {
        [Required]
        public string Name { get; set; } = "";
        public int TotalVolume { get; set; }
        public int Duration { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateNextScheduled { get; set; }
        public bool IsFavourited { get; set; }

        public int UserId { get; set; }
    }
}
