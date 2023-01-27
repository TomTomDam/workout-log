using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class WorkoutExerciseSet : Entity
    {
        [Required]
        public int Number { get; set; }

        [Required]
        public int Weight { get; set; }

        [Required]
        public int Reps { get; set; }

        public int? RateOfPerceivedExertionRating { get; set; }

        public int? RepsInReserveRating { get; set; }

        public string WorkoutExerciseSetType { get; set; } = "";
    }
}
