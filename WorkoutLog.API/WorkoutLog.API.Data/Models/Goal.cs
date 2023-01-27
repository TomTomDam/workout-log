using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class Goal : Entity
    {
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = $"The {nameof(CurrentValue)} field is required.")]
        public int CurrentValue { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = $"The {nameof(GoalValue)} field is required.")]
        public int GoalValue { get; set; }

        public DateTime DateCreated { get; set; }

        public DateTime Deadline { get; set; }

        [Required]
        public string GoalType { get; set; } = "";

        public int ExerciseId { get; set; }

        public int UserId { get; set; }
    }
}
