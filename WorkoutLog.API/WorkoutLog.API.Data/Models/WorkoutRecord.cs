namespace WorkoutLog.API.Data.Models
{
    public class WorkoutRecord
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";

        public int WorkoutExerciseId { get; set; }
        public WorkoutExercise WorkoutExercise { get; set; } = new WorkoutExercise();
        public int WorkoutId { get; set; }
        public Workout Workout { get; set; } = new Workout();
    }
}
