namespace WorkoutLog.API.Models
{
    public class Goal
    {
        public int Id { get; set; }
        public int CurrentValue { get; set; }
        public int GoalValue { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime Deadline { get; set; }
        public string GoalType { get; set; } = "";

        public int ExerciseId { get; set; }
        public Exercise Exercise { get; set; } = new Exercise();
        public int UserId { get; set; }
        public User User { get; set; } = new User();
    }
}
