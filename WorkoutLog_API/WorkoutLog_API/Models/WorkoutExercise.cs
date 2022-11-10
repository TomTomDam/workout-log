namespace WorkoutLog_API.Models
{
    public class WorkoutExercise
    {
        public int WorkoutExerciseId { get; set; }
        public string? Notes { get; set; }
        public int Order { get; set; }
        public int WorkoutExerciseSetId { get; set; }
        public int ExerciseId { get; set; }
    }
}
