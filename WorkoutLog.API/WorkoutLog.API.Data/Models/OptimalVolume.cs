namespace WorkoutLog.API.Models
{
    public class OptimalVolume
    {
        public int Id { get; set; }
        public int Volume { get; set; }

        public int MuscleGroupId { get; set; }
        public MuscleGroup MuscleGroup { get; set; } = new MuscleGroup();
    }
}
