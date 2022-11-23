namespace WorkoutLog.API.Data.Models
{
    public class WorkoutExerciseSet
    {
        public int Id { get; set; }
        public int Number { get; set; }
        public int Weight { get; set; }
        public int Reps { get; set; }
        public int? RateOfPerceivedExertionRating { get; set; }
        public int? RepsInReserveRating { get; set; }
        public string WorkoutExerciseSetType { get; set; } = "";

        public WorkoutExercise WorkoutExercise { get; set; } = new WorkoutExercise();
    }
}
