using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class User : Entity
    {
        [Required]
        public string Name { get; set; } = "";

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = $"The {nameof(Age)} field is required.")]
        public int Age { get; set; }

        public int Bodyweight { get; set; }

        public DateTime DateRegistered { get; set; }

        public string Gender { get; set; } = "";

        public string TrainingStyles { get; set; } = "";
    }
}
