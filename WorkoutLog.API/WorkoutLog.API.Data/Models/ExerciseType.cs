using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class ExerciseType : Entity
    {
        [Required]
        public string Name { get; set; } = "";

        public string? Description { get; set; }
    }
}
