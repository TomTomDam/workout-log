using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class Exercise : Entity
    {
        [Required]
        public string Name { get; set; } = "";

        public bool IsCustom { get; set; }

        public string? Instructions { get; set; }

        //public string? Images { get; set; }

        //public string? PortraitImage { get; set; }

        public int ExerciseTypeId { get; set; }

        public int EquipmentId { get; set; }

        public int PrimaryMusclesWorkedId { get; set; }
    }
}
