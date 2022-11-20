namespace WorkoutLog.API.Models
{
    public class ExerciseType
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public string? Description { get; set; }

        public Exercise Exercise { get; set; } = new Exercise();
    }
}
