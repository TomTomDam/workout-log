using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Tests.Fixtures.Controllers;

namespace WorkoutLog.API.Tests.Controllers
{
    public class EquipmentControllerTests : IClassFixture<EquipmentControllerFixture>, IDisposable
    {
        EquipmentControllerFixture _fixture;

        public EquipmentControllerTests(EquipmentControllerFixture fixture)
        {
            _fixture = fixture;
        }

        #region GetAll
        [Fact]
        public async Task GetAll_OkResponse_ReturnsListOfEquipment()
        {
            var equipmentList = _fixture.fixture.Create<IEnumerable<Equipment>>();

            _fixture.mockEquipmentRepo.Setup(x => x.GetAll()).ReturnsAsync(equipmentList);

            var result = await _fixture.equipmentController.GetAll();
            var okResult = result as OkObjectResult;

            _fixture.mockEquipmentRepo.Verify(x => x.GetAll(), Times.Once);

            Assert.IsType<OkObjectResult>(result);
            Assert.Equal(equipmentList, okResult?.Value);
        }
        #endregion

        #region GetByID
        [Fact]
        public async Task GetById_OkResponse_ReturnsEquipment()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.GetById(equipment.Id)).ReturnsAsync(equipment);

            var result = await _fixture.equipmentController.GetById(equipment.Id);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetById_NotFoundResponse_WhenEquipmentIsNotFound()
        {
            _fixture.mockEquipmentRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync(() => null!);

            var result = await _fixture.equipmentController.GetById(1);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<NotFoundResult>(result);
        }
        #endregion

        #region Create
        [Fact]
        public async Task Create_OkResponse_CreatesEquipment()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.Insert(equipment));

            var result = await _fixture.equipmentController.Create(equipment);

            _fixture.mockEquipmentRepo.Verify(x => x.Insert(It.IsAny<Equipment>()), Times.Once);

            Assert.IsType<OkResult>(result);
        }

        [Fact]
        public async Task Create_BadRequestResponse_ExceptionThrown()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.Insert(equipment)).ThrowsAsync(new Exception());

            var result = await _fixture.equipmentController.Create(equipment);

            _fixture.mockEquipmentRepo.Verify(x => x.Insert(It.IsAny<Equipment>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        #region Update
        [Fact]
        public async Task Update_NoContentResponse_UpdatesEquipment()
        {
            var id = 1;
            var existingEquipment = new Equipment
            {
                Id = id,
                Name = "Dumbbell"
            };
            var newEquipment = new Equipment
            {
                Id = id,
                Name = "Barbell"
            };

            _fixture.mockEquipmentRepo.Setup(x => x.GetById(id)).ReturnsAsync(existingEquipment);
            _fixture.mockEquipmentRepo.Setup(x => x.Update(newEquipment)).ReturnsAsync(true);

            var result = await _fixture.equipmentController.Update(id, newEquipment);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockEquipmentRepo.Verify(x => x.Update(It.IsAny<Equipment>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Update_NotFoundResponse_WhenEquipmentIsNotFound()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync(() => null!);

            var result = await _fixture.equipmentController.Update(equipment.Id, equipment);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockEquipmentRepo.Verify(x => x.Update(It.IsAny<Equipment>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Update_BadRequestResponse_WhenEquipmentIsNotUpdated()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.GetById(equipment.Id)).ReturnsAsync(equipment);
            _fixture.mockEquipmentRepo.Setup(x => x.Update(equipment)).ReturnsAsync(false);

            var result = await _fixture.equipmentController.Update(equipment.Id, equipment);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockEquipmentRepo.Verify(x => x.Update(It.IsAny<Equipment>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        #region Delete
        [Fact]
        public async Task Delete_NoContentResponse_DeletesEquipment()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.GetById(equipment.Id)).ReturnsAsync(equipment);
            _fixture.mockEquipmentRepo.Setup(x => x.Delete(equipment)).ReturnsAsync(true);

            var result = await _fixture.equipmentController.Delete(equipment.Id);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockEquipmentRepo.Verify(x => x.Delete(It.IsAny<Equipment>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Delete_NotFoundResponse_WhenEquipmentIsNotFound()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync(() => null!);

            var result = await _fixture.equipmentController.Delete(equipment.Id);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockEquipmentRepo.Verify(x => x.Delete(It.IsAny<Equipment>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Delete_BadRequestResponse_WhenEquipmentIsNotDeleted()
        {
            var equipment = _fixture.fixture.Create<Equipment>();

            _fixture.mockEquipmentRepo.Setup(x => x.GetById(equipment.Id)).ReturnsAsync(equipment);
            _fixture.mockEquipmentRepo.Setup(x => x.Delete(equipment)).ReturnsAsync(false);

            var result = await _fixture.equipmentController.Delete(equipment.Id);

            _fixture.mockEquipmentRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockEquipmentRepo.Verify(x => x.Delete(It.IsAny<Equipment>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        public void Dispose()
        {
            _fixture.mockEquipmentRepo.Invocations.Clear();
        }
    }
}
