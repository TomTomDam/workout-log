namespace WorkoutLog.API.Models
{
    public class WorkoutRecord
    {
        public int WorkoutRecordId { get; set; }
        public string Name { get; set; } = "";

        public int WorkoutExerciseId { get; set; }
        public WorkoutExercise WorkoutExercise { get; set; } = new WorkoutExercise();
        public int WorkoutId { get; set; }
        public Workout Workout { get; set; } = new Workout();
    }
}
