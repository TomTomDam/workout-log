using AutoFixture;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class WorkoutExerciseControllerFixture
    {
        public WorkoutExerciseController workoutExerciseController;
        public Mock<IWorkoutExerciseRepository> mockWorkoutExerciseRepo;
        public IFixture fixture;

        public WorkoutExerciseControllerFixture()
        {
            mockWorkoutExerciseRepo = new Mock<IWorkoutExerciseRepository>();
            workoutExerciseController = new WorkoutExerciseController(mockWorkoutExerciseRepo.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
