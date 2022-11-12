namespace WorkoutLog_API.Models
{
    public class Goal
    {
        public int GoalId { get; set; }
        public int CurrentValue { get; set; }
        public int GoalValue { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime Deadline { get; set; }
        public int GoalTypeId { get; set; }
        public int ExerciseId { get; set; }
        public int UserId { get; set; }
    }
}
