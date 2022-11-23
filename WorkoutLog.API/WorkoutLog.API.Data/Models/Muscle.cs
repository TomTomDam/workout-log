namespace WorkoutLog.API.Data.Models
{
    public class Muscle
    {
        public int Id { get; set; }
        public string ScientificName { get; set; } = "";
        public bool IsCustom { get; set; }

        public int MuscleGroupId { get; set; }
        public MuscleGroup MuscleGroup { get; set; } = new MuscleGroup();
    }
}
