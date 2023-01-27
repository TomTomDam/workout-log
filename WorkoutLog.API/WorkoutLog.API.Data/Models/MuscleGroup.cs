using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class MuscleGroup : Entity
    {
        [Required]
        public string Name { get; set; } = "";
    }
}
