using AutoFixture;
using Microsoft.Extensions.Logging;
using Moq;
using WorkoutLog.API.Controllers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Tests.Fixtures.Controllers
{
    public class EquipmentControllerFixture
    {
        public EquipmentController equipmentController;
        public Mock<IEquipmentRepository> mockEquipmentRepo;
        public Mock<ILogger<EquipmentController>> mockLogger;
        public IFixture fixture;

        public EquipmentControllerFixture()
        {
            mockEquipmentRepo = new Mock<IEquipmentRepository>();
            mockLogger = new Mock<ILogger<EquipmentController>>();
            equipmentController = new EquipmentController(mockEquipmentRepo.Object, mockLogger.Object);

            fixture = new Fixture();
            fixture.Behaviors.OfType<ThrowingRecursionBehavior>()
                .ToList()
                .ForEach(b => fixture.Behaviors.Remove(b));
            fixture.Behaviors.Add(new OmitOnRecursionBehavior());
        }
    }
}
