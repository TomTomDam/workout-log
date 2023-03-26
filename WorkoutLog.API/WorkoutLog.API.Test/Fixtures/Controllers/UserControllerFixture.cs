using AutoFixture;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class UserControllerFixture
    {
        public UserController userController;
        public Mock<IUserRepository> mockUserRepo;
        public IFixture fixture;

        public UserControllerFixture()
        {
            mockUserRepo = new Mock<IUserRepository>();
            userController = new UserController(mockUserRepo.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
