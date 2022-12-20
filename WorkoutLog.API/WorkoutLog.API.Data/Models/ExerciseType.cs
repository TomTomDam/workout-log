namespace WorkoutLog.API.Data.Models
{
    public class ExerciseType : Entity
    {
        public string Name { get; set; } = "";
        public string? Description { get; set; }
    }
}
