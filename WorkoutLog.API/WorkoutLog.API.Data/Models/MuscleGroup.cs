﻿namespace WorkoutLog.API.Data.Models
{
    public class MuscleGroup
    {
        public int Id { get; set; }
        public string Name { get; set; } = "";

        public ICollection<Muscle> Muscles { get; set; } = new List<Muscle>();
        public ICollection<ExerciseOtherMusclesWorked> Exercises { get; set; } = new List<ExerciseOtherMusclesWorked>();
        public Exercise Exercise { get; set; } = new Exercise();
        public OptimalVolume OptimalVolume { get; set; } = new OptimalVolume();
    }
}