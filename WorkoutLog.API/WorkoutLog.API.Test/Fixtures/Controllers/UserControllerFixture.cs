using AutoFixture;
using Microsoft.Extensions.Logging;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class UserControllerFixture
    {
        public UserController userController;
        public Mock<IUserRepository> mockUserRepo;
        public Mock<ILogger<UserController>> mockLogger;
        public IFixture fixture;

        public UserControllerFixture()
        {
            mockUserRepo = new Mock<IUserRepository>();
            mockLogger = new Mock<ILogger<UserController>>();
            userController = new UserController(mockUserRepo.Object, mockLogger.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
