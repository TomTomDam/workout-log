namespace WorkoutLog.API.Models
{
    public class WorkoutRecord
    {
        public int WorkoutRecordId { get; set; }
        public string Name { get; set; } = "";

        public int WorkoutExerciseSetId { get; set; }
        public WorkoutExerciseSet WorkoutExerciseSet { get; set; } = new WorkoutExerciseSet();
        public int WorkoutId { get; set; }
        public Workout Workout { get; set; } = new Workout();
    }
}
