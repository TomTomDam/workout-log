using AutoFixture;
using Microsoft.Extensions.Logging;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class ExerciseControllerFixture
    {
        public ExerciseController exerciseController;
        public Mock<IExerciseRepository> mockExerciseRepo;
        public Mock<ILogger<ExerciseController>> mockLogger;
        public IFixture fixture;

        public ExerciseControllerFixture()
        {
            mockExerciseRepo = new Mock<IExerciseRepository>();
            mockLogger = new Mock<ILogger<ExerciseController>>();
            exerciseController = new ExerciseController(mockExerciseRepo.Object, mockLogger.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
