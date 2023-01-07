using AutoFixture;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class ExerciseControllerFixture
    {
        public ExerciseController exerciseController;
        public Mock<IExerciseRepository> mockExerciseRepo;
        public IFixture fixture;

        public ExerciseControllerFixture()
        {
            mockExerciseRepo = new Mock<IExerciseRepository>();
            exerciseController = new ExerciseController(mockExerciseRepo.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
