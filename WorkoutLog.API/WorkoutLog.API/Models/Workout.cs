namespace WorkoutLog.API.Models
{
    public class Workout
    {
        public int WorkoutId { get; set; }
        public string Name { get; set; } = "";
        public int TotalVolume { get; set; }
        public int Duration { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime? DateNextScheduled { get; set; }
        public bool IsFavourited { get; set; }

        public int WorkoutExerciseId { get; set; }
        public WorkoutExercise WorkoutExercise { get; set; } = new WorkoutExercise();
        //public int? ScheduledWorkoutId { get; set; }
        //public ScheduledWorkout? ScheduledWorkout { get; set; } = new ScheduledWorkout();
        public int UserId { get; set; }
        public User User { get; set; } = new User();
    }
}
