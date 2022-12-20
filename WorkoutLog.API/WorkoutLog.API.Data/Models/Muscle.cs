namespace WorkoutLog.API.Data.Models
{
    public class Muscle : Entity
    {
        public string ScientificName { get; set; } = "";
        public bool IsCustom { get; set; }

        public int MuscleGroupId { get; set; }
    }
}
