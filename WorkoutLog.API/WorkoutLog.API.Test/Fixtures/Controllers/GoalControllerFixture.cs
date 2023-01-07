using AutoFixture;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class GoalControllerFixture
    {
        public GoalController goalController;
        public Mock<IGoalRepository> mockGoalRepo;
        public IFixture fixture;

        public GoalControllerFixture()
        {
            mockGoalRepo = new Mock<IGoalRepository>();
            goalController = new GoalController(mockGoalRepo.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
