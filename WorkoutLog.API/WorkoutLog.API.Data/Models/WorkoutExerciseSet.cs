using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class WorkoutExerciseSet : Entity
    {
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = $"The {nameof(Number)} field is required.")]
        public int Number { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = $"The {nameof(Weight)} field is required.")]
        public int Weight { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = $"The {nameof(Reps)} field is required.")]
        public int Reps { get; set; }

        public int? RateOfPerceivedExertionRating { get; set; }

        public int? RepsInReserveRating { get; set; }

        public string WorkoutExerciseSetType { get; set; } = "";
    }
}
