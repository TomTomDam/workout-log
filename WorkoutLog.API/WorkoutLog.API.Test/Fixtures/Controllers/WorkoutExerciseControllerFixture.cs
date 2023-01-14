using AutoFixture;
using Microsoft.Extensions.Logging;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class WorkoutExerciseControllerFixture
    {
        public WorkoutExerciseController workoutExerciseController;
        public Mock<IWorkoutExerciseRepository> mockWorkoutExerciseRepo;
        public Mock<ILogger<WorkoutExerciseController>> mockLogger;
        public IFixture fixture;

        public WorkoutExerciseControllerFixture()
        {
            mockWorkoutExerciseRepo = new Mock<IWorkoutExerciseRepository>();
            mockLogger = new Mock<ILogger<WorkoutExerciseController>>();
            workoutExerciseController = new WorkoutExerciseController(mockWorkoutExerciseRepo.Object, mockLogger.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
