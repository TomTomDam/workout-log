using System.ComponentModel.DataAnnotations;

namespace WorkoutLog.API.Data.Models
{
    public class Equipment : Entity
    {
        [Required]
        public string Name { get; set; } = "";

        public string EquipmentType { get; set; } = "";
    }
}
