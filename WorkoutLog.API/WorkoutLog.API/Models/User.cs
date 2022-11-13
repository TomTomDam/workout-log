namespace WorkoutLog.API.Models
{
    public class User
    {
        public int UserId { get; set; }
        public string Name { get; set; } = "";
        public int Age { get; set; }
        public int Bodyweight { get; set; }
        public DateTime DateRegistered { get; set; }
        public string Gender { get; set; } = "";
        public string TrainingStyles { get; set; } = "";

        public Preference Preference { get; set; } = new Preference();
        public ICollection<Workout> Workouts { get; set; } = new List<Workout>();
        public ICollection<Goal> Goals { get; set; } = new List<Goal>();
    }
}
