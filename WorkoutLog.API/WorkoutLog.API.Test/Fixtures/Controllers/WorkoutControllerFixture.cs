using AutoFixture;
using Microsoft.Extensions.Logging;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class WorkoutControllerFixture
    {
        public WorkoutController workoutController;
        public Mock<IWorkoutRepository> mockWorkoutRepo;
        public Mock<ILogger<WorkoutController>> mockLogger;
        public IFixture fixture;

        public WorkoutControllerFixture()
        {
            mockWorkoutRepo = new Mock<IWorkoutRepository>();
            mockLogger = new Mock<ILogger<WorkoutController>>();
            workoutController = new WorkoutController(mockWorkoutRepo.Object, mockLogger.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
