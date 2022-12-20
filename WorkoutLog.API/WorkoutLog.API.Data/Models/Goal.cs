namespace WorkoutLog.API.Data.Models
{
    public class Goal : Entity
    {
        public int CurrentValue { get; set; }
        public int GoalValue { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime Deadline { get; set; }
        public string GoalType { get; set; } = "";

        public int ExerciseId { get; set; }
        public int UserId { get; set; }
    }
}
