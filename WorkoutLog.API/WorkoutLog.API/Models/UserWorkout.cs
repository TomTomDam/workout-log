namespace WorkoutLog.API.Models
{
    public class UserWorkout
    {
        public int UserWorkoutId { get; set; }
        public int UserId { get; set; }
        public int WorkoutId { get; set; }
    }
}
