namespace WorkoutLog.API.Data.Models
{
    public class WorkoutRecord : Entity
    {
        public string Name { get; set; } = "";

        public int WorkoutExerciseId { get; set; }
        public int WorkoutId { get; set; }
    }
}
