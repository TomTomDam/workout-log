namespace WorkoutLog.API.Models
{
    public class MuscleGroup
    {
        public int MuscleGroupId { get; set; }
        public string Name { get; set; } = "";

        public ICollection<Muscle> Muscles { get; set; } = new List<Muscle>();
        public ICollection<Exercise> Exercises { get; set; } = new List<Exercise>();
        public OptimalVolume OptimalVolume { get; set; } = new OptimalVolume();
    }
}
