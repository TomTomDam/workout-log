using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Data
{
    public class WorkoutLogDBContext : DbContext
    {
        public DbSet<User> User { get; set; }
        public DbSet<Equipment> Equipment { get; set; }
        public DbSet<Exercise> Exercise { get; set; }
        public DbSet<ExerciseType> ExerciseType { get; set; }
        public DbSet<Goal> Goal { get; set; }
        public DbSet<Muscle> Muscle { get; set; }
        public DbSet<MuscleGroup> MuscleGroup { get; set; }
        public DbSet<ExerciseOtherMusclesWorked> ExerciseOtherMusclesWorked { get; set; }
        public DbSet<OptimalVolume> OptimalVolume { get; set; }
        public DbSet<Preference> Preference { get; set; }
        public DbSet<UserWorkout> UserWorkout { get; set; }
        public DbSet<Workout> Workout { get; set; }
        public DbSet<WorkoutExercise> WorkoutExercise { get; set; }
        public DbSet<WorkoutExerciseSet> WorkoutExerciseSet { get; set; }
        public DbSet<WorkoutRecord> WorkoutRecord { get; set; }

        public WorkoutLogDBContext(DbContextOptions options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ExerciseOtherMusclesWorked>()
                .HasKey(emg => new { emg.ExerciseId, emg.OtherMusclesWorkedId });
            modelBuilder.Entity<ExerciseOtherMusclesWorked>()
                .HasOne<Exercise>(emg => emg.Exercise)
                .WithMany(e => e.OtherMusclesWorked)
                .HasForeignKey(emg => emg.ExerciseId);
            modelBuilder.Entity<ExerciseOtherMusclesWorked>()
                .HasOne<MuscleGroup>(emg => emg.OtherMusclesWorked)
                .WithMany(mg => mg.Exercises)
                .HasForeignKey(emg => emg.OtherMusclesWorkedId);
        }
    }
}
