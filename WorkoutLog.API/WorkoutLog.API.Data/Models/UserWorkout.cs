namespace WorkoutLog.API.Data.Models
{
    public class UserWorkout : Entity
    {
        public int UserId { get; set; }

        public int WorkoutId { get; set; }
    }
}
