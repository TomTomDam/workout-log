using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Data.Models
{
    public class UserWorkout
    {
        public int Id { get; set; }

        public int UserId { get; set; }
        public User User { get; set; } = new User();
        public int WorkoutId { get; set; }
        public Workout Workout { get; set; } = new Workout();
    }
}
