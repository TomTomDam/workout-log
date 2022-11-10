namespace WorkoutLog_API.Models
{
    public class WorkoutRecord
    {
        public int WorkoutRecordId { get; set; }
        public string Name { get; set; } = "";
        public int WorkoutExerciseSetId { get; set; }
        public int WorkoutId { get; set; }
    }
}
