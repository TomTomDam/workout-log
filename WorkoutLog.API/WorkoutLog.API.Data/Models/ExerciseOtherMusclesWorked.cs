namespace WorkoutLog.API.Data.Models
{
    public class ExerciseOtherMusclesWorked
    {
        public int ExerciseId { get; set; }
        public Exercise Exercise { get; set; } = new Exercise();
        public int OtherMusclesWorkedId { get; set; }
        public MuscleGroup OtherMusclesWorked { get; set; } = new MuscleGroup();
    }
}