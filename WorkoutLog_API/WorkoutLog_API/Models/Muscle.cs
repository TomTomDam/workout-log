namespace WorkoutLog_API.Models
{
    public class Muscle
    {
        public int MuscleId { get; set; }
        public string ScientificName { get; set; } = "";
        public bool IsCustom { get; set; }
        public int MuscleGroupId { get; set; }
    }
}
