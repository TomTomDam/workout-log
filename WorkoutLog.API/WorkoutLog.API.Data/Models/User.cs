namespace WorkoutLog.API.Data.Models
{
    public class User : Entity
    {
        public string Name { get; set; } = "";
        public int Age { get; set; }
        public int Bodyweight { get; set; }
        public DateTime DateRegistered { get; set; }
        public string Gender { get; set; } = "";
        public string TrainingStyles { get; set; } = "";
    }
}
