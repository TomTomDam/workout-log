using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Models;

namespace WorkoutLog.API.Data
{
    public class WorkoutLogDBContext : DbContext
    {
        public WorkoutLogDBContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Equipment> Equipment { get; set; }
        public DbSet<Exercise> Exercises { get; set; }
        public DbSet<ExerciseType> ExerciseTypes { get; set; }
        public DbSet<Goal> Goals { get; set; }
        public DbSet<Muscle> Muscles { get; set; }
        public DbSet<MuscleGroup> MuscleGroups { get; set; }
        public DbSet<OptimalVolume> OptimalVolumes { get; set; }
        public DbSet<Preference> Preferences { get; set; }
        public DbSet<UserWorkout> UserWorkouts { get; set; }
        public DbSet<Workout> Workouts { get; set; }
        public DbSet<WorkoutExercise> WorkoutExercises { get; set; }
        public DbSet<WorkoutExerciseSet> WorkoutExerciseSets { get; set; }
        public DbSet<WorkoutRecord> WorkoutRecords { get; set; }
    }
}
