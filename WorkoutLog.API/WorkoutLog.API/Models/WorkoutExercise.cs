namespace WorkoutLog.API.Models
{
    public class WorkoutExercise
    {
        public int WorkoutExerciseId { get; set; }
        public string? Notes { get; set; }
        public int Order { get; set; }

        public int WorkoutId { get; set; }
        public Workout Workout { get; set; } = new Workout();
        public ICollection<WorkoutExerciseSet> WorkoutExerciseSets { get; set; } = new List<WorkoutExerciseSet>();
        public int ExerciseId { get; set; }
        public Exercise Exercise { get; set; } = new Exercise();
    }
}
