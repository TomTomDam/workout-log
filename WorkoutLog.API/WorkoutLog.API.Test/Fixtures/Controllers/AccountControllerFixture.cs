using AutoFixture;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class AccountControllerFixture
    {
        public AccountController accountController;
        public Mock<IUserRepository> mockUserRepo;
        public IFixture fixture;

        public AccountControllerFixture()
        {
            mockUserRepo = new Mock<IUserRepository>();
            accountController = new AccountController(mockUserRepo.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
