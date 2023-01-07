using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Tests.Fixtures.Controllers;

namespace WorkoutLog.API.Tests.Controllers
{
    public class WorkoutExerciseControllerTests : IClassFixture<WorkoutExerciseControllerFixture>, IDisposable
    {
        WorkoutExerciseControllerFixture _fixture;

        public WorkoutExerciseControllerTests(WorkoutExerciseControllerFixture fixture)
        {
            _fixture = fixture;
        }

        #region GetAll
        [Fact]
        public async Task GetAll_OkResponse_ReturnsListOfWorkoutExercises()
        {
            var workoutExerciseList = _fixture.fixture.Create<IEnumerable<WorkoutExercise>>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetAll()).ReturnsAsync(workoutExerciseList);

            var result = await _fixture.workoutExerciseController.GetAll();
            var okResult = result as OkObjectResult;

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetAll(), Times.Once);

            Assert.IsType<OkObjectResult>(result);
            Assert.Equal(workoutExerciseList, okResult?.Value);
        }
        #endregion

        #region GetByID
        [Fact]
        public async Task GetById_OkResponse_ReturnsWorkoutExercise()
        {
            var workoutExercise = _fixture.fixture.Create<WorkoutExercise>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(workoutExercise.Id)).ReturnsAsync(workoutExercise);

            var result = await _fixture.workoutExerciseController.GetById(workoutExercise.Id);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetById_NotFoundResponse_WhenWorkoutExerciseIsNotFound()
        {
            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((WorkoutExercise)null);

            var result = await _fixture.workoutExerciseController.GetById(1);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<NotFoundResult>(result);
        }
        #endregion

        #region Create
        [Fact]
        public async Task Create_OkResponse_CreatesWorkoutExercise()
        {
            var workoutExercise = _fixture.fixture.Create<WorkoutExercise>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.Insert(workoutExercise));

            var result = await _fixture.workoutExerciseController.Create(workoutExercise);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.Insert(It.IsAny<WorkoutExercise>()), Times.Once);

            Assert.IsType<OkResult>(result);
        }
        #endregion

        #region Update
        [Fact]
        public async Task Update_NoContentResponse_UpdatesWorkoutExercise()
        {
            var id = 1;
            var existingWorkoutExercise = new WorkoutExercise
            {
                Id = id,
                Notes = "Everybody wanna be a bodybuilder"
            };
            var newWorkoutExercise = new WorkoutExercise
            {
                Id = id,
                Notes = "Don't nobody wanna lift this heavy ass weight!!"
            };

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(id)).ReturnsAsync(existingWorkoutExercise);
            _fixture.mockWorkoutExerciseRepo.Setup(x => x.Update(newWorkoutExercise)).ReturnsAsync(true);

            var result = await _fixture.workoutExerciseController.Update(id, newWorkoutExercise);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutExerciseRepo.Verify(x => x.Update(It.IsAny<WorkoutExercise>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Update_NotFoundResponse_WhenWorkoutExerciseIsNotFound()
        {
            var workoutExercise = _fixture.fixture.Create<WorkoutExercise>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((WorkoutExercise)null);

            var result = await _fixture.workoutExerciseController.Update(workoutExercise.Id, workoutExercise);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutExerciseRepo.Verify(x => x.Update(It.IsAny<WorkoutExercise>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Update_BadRequestResponse_WhenWorkoutExerciseIsNotUpdated()
        {
            var workoutExercise = _fixture.fixture.Create<WorkoutExercise>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(workoutExercise.Id)).ReturnsAsync(workoutExercise);
            _fixture.mockWorkoutExerciseRepo.Setup(x => x.Update(workoutExercise)).ReturnsAsync(false);

            var result = await _fixture.workoutExerciseController.Update(workoutExercise.Id, workoutExercise);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutExerciseRepo.Verify(x => x.Update(It.IsAny<WorkoutExercise>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        #region Delete
        [Fact]
        public async Task Delete_NoContentResponse_DeletesWorkoutExercise()
        {
            var workoutExercise = _fixture.fixture.Create<WorkoutExercise>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(workoutExercise.Id)).ReturnsAsync(workoutExercise);
            _fixture.mockWorkoutExerciseRepo.Setup(x => x.Delete(workoutExercise)).ReturnsAsync(true);

            var result = await _fixture.workoutExerciseController.Delete(workoutExercise.Id);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutExerciseRepo.Verify(x => x.Delete(It.IsAny<WorkoutExercise>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Delete_NotFoundResponse_WhenWorkoutExerciseIsNotFound()
        {
            var workoutExercise = _fixture.fixture.Create<WorkoutExercise>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((WorkoutExercise)null);

            var result = await _fixture.workoutExerciseController.Delete(workoutExercise.Id);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutExerciseRepo.Verify(x => x.Delete(It.IsAny<WorkoutExercise>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Delete_BadRequestResponse_WhenWorkoutExerciseIsNotDeleted()
        {
            var workoutExercise = _fixture.fixture.Create<WorkoutExercise>();

            _fixture.mockWorkoutExerciseRepo.Setup(x => x.GetById(workoutExercise.Id)).ReturnsAsync(workoutExercise);
            _fixture.mockWorkoutExerciseRepo.Setup(x => x.Delete(workoutExercise)).ReturnsAsync(false);

            var result = await _fixture.workoutExerciseController.Delete(workoutExercise.Id);

            _fixture.mockWorkoutExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutExerciseRepo.Verify(x => x.Delete(It.IsAny<WorkoutExercise>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        public void Dispose()
        {
            _fixture.mockWorkoutExerciseRepo.Invocations.Clear();
        }
    }
}
