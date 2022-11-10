namespace WorkoutLog_API.Models
{
    public class Exercise
    {
        public int ExerciseId { get; set; }
        public string Name { get; set; } = "";
        public bool IsCustom { get; set; }
        public string? Instructions { get; set; }
        //public string? Images { get; set; }
        //public string PortraitImage { get; set; }
        public int ExerciseTypeId { get; set; }
        public int EquipmentId { get; set; }
        public int PrimaryMusclesWorked { get; set; }
        public int? OtherMusclesWorked { get; set; }
        public int? UserId { get; set; }
    }
}
