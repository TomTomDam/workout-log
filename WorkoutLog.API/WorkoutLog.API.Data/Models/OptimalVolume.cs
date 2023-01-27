using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class OptimalVolume : Entity
    {
        [Required]
        public int Volume { get; set; }

        public int MuscleGroupId { get; set; }
    }
}
