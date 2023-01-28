namespace WorkoutLog.API.Data.Models
{
    public class WorkoutExercise : Entity
    {
        public string? Notes { get; set; }

        public int Order { get; set; }

        public int WorkoutId { get; set; }

        public int ExerciseId { get; set; }
    }
}
