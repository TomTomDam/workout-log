using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Data.Models
{
    public class Workout
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public int TotalVolume { get; set; }
        public int Duration { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateNextScheduled { get; set; }
        public bool IsFavourited { get; set; }

        public ICollection<WorkoutExercise> WorkoutExercises { get; set; } = new List<WorkoutExercise>();
        public ICollection<WorkoutRecord> WorkoutRecords { get; set; } = new List<WorkoutRecord>();
        public int UserId { get; set; }
        public User User { get; set; } = new User();
    }
}
