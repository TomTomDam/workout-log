namespace WorkoutLog.API.Models
{
    public class WorkoutExercise
    {
        public int WorkoutExerciseId { get; set; }
        public string? Notes { get; set; }
        public int Order { get; set; }

        public int WorkoutExerciseSetId { get; set; }
        public WorkoutExerciseSet WorkoutExerciseSet { get; set; } = new WorkoutExerciseSet();
        public int ExerciseId { get; set; }
        public Exercise Exercise { get; set; } = new Exercise();
    }
}
