using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class Muscle : Entity
    {
        [Required]
        public string ScientificName { get; set; } = "";

        [Required]
        public bool IsCustom { get; set; }

        public int MuscleGroupId { get; set; }
    }
}
