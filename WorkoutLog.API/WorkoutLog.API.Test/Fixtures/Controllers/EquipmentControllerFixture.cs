using AutoFixture;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class EquipmentControllerFixture
    {
        public EquipmentController equipmentController;
        public Mock<IEquipmentRepository> mockEquipmentRepo;
        public IFixture fixture;

        public EquipmentControllerFixture()
        {
            mockEquipmentRepo = new Mock<IEquipmentRepository>();
            equipmentController = new EquipmentController(mockEquipmentRepo.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
