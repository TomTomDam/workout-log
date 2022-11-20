namespace WorkoutLog.API.Models
{
    public class Exercise
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";
        public bool IsCustom { get; set; }
        public string? Instructions { get; set; }
        //public string? Images { get; set; }
        //public string? PortraitImage { get; set; }

        public int ExerciseTypeId { get; set; }
        public ExerciseType ExerciseType { get; set; } = new ExerciseType();
        public int EquipmentId { get; set; }
        public Equipment Equipment { get; set; } = new Equipment();
        public int PrimaryMusclesWorkedId { get; set; }
        public MuscleGroup PrimaryMusclesWorked { get; set; } = new MuscleGroup();
        public ICollection<MuscleGroup> OtherMusclesWorked { get; set; } = new List<MuscleGroup>();
        public WorkoutExercise WorkoutExercise { get; set; } = new WorkoutExercise();
        public Goal Goal { get; set; } = new Goal();
    }
}
