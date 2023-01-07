using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Tests.Fixtures.Controllers;

namespace WorkoutLog.API.Tests.Controllers
{
    public class WorkoutControllerTests : IClassFixture<WorkoutControllerFixture>, IDisposable
    {
        WorkoutControllerFixture _fixture;

        public WorkoutControllerTests(WorkoutControllerFixture fixture)
        {
            _fixture = fixture;
        }

        #region GetAll
        [Fact]
        public async Task GetAll_OkResponse_ReturnsListOfWorkouts()
        {
            var workoutList = _fixture.fixture.Create<IEnumerable<Workout>>();

            _fixture.mockWorkoutRepo.Setup(x => x.GetAll()).ReturnsAsync(workoutList);

            var result = await _fixture.workoutController.GetAll();
            var okResult = result as OkObjectResult;

            _fixture.mockWorkoutRepo.Verify(x => x.GetAll(), Times.Once);

            Assert.IsType<OkObjectResult>(result);
            Assert.Equal(workoutList, okResult?.Value);
        }
        #endregion

        #region GetByID
        [Fact]
        public async Task GetById_OkResponse_ReturnsWorkout()
        {
            var workout = _fixture.fixture.Create<Workout>();

            _fixture.mockWorkoutRepo.Setup(x => x.GetById(workout.Id)).ReturnsAsync(workout);

            var result = await _fixture.workoutController.GetById(workout.Id);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetById_NotFoundResponse_WhenWorkoutIsNotFound()
        {
            _fixture.mockWorkoutRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Workout)null);

            var result = await _fixture.workoutController.GetById(1);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<NotFoundResult>(result);
        }
        #endregion

        #region Create
        [Fact]
        public async Task Create_OkResponse_CreatesWorkout()
        {
            var workout = _fixture.fixture.Create<Workout>();

            _fixture.mockWorkoutRepo.Setup(x => x.Insert(workout));

            var result = await _fixture.workoutController.Create(workout);

            _fixture.mockWorkoutRepo.Verify(x => x.Insert(It.IsAny<Workout>()), Times.Once);

            Assert.IsType<OkResult>(result);
        }
        #endregion

        #region Update
        [Fact]
        public async Task Update_NoContentResponse_UpdatesWorkout()
        {
            var id = 1;
            var existingWorkout = new Workout
            {
                Id = id,
                Name = "Push"
            };
            var newWorkout = new Workout
            {
                Id = id,
                Name = "Pull"
            };

            _fixture.mockWorkoutRepo.Setup(x => x.GetById(id)).ReturnsAsync(existingWorkout);
            _fixture.mockWorkoutRepo.Setup(x => x.Update(newWorkout)).ReturnsAsync(true);

            var result = await _fixture.workoutController.Update(id, newWorkout);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutRepo.Verify(x => x.Update(It.IsAny<Workout>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Update_NotFoundResponse_WhenWorkoutIsNotFound()
        {
            var workout = _fixture.fixture.Create<Workout>();

            _fixture.mockWorkoutRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Workout)null);

            var result = await _fixture.workoutController.Update(workout.Id, workout);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutRepo.Verify(x => x.Update(It.IsAny<Workout>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Update_BadRequestResponse_WhenWorkoutIsNotUpdated()
        {
            var workout = _fixture.fixture.Create<Workout>();

            _fixture.mockWorkoutRepo.Setup(x => x.GetById(workout.Id)).ReturnsAsync(workout);
            _fixture.mockWorkoutRepo.Setup(x => x.Update(workout)).ReturnsAsync(false);

            var result = await _fixture.workoutController.Update(workout.Id, workout);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutRepo.Verify(x => x.Update(It.IsAny<Workout>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        #region Delete
        [Fact]
        public async Task Delete_NoContentResponse_DeletesWorkout()
        {
            var workout = _fixture.fixture.Create<Workout>();

            _fixture.mockWorkoutRepo.Setup(x => x.GetById(workout.Id)).ReturnsAsync(workout);
            _fixture.mockWorkoutRepo.Setup(x => x.Delete(workout)).ReturnsAsync(true);

            var result = await _fixture.workoutController.Delete(workout.Id);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutRepo.Verify(x => x.Delete(It.IsAny<Workout>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Delete_NotFoundResponse_WhenWorkoutIsNotFound()
        {
            var workout = _fixture.fixture.Create<Workout>();

            _fixture.mockWorkoutRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Workout)null);

            var result = await _fixture.workoutController.Delete(workout.Id);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutRepo.Verify(x => x.Delete(It.IsAny<Workout>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Delete_BadRequestResponse_WhenWorkoutIsNotDeleted()
        {
            var workout = _fixture.fixture.Create<Workout>();

            _fixture.mockWorkoutRepo.Setup(x => x.GetById(workout.Id)).ReturnsAsync(workout);
            _fixture.mockWorkoutRepo.Setup(x => x.Delete(workout)).ReturnsAsync(false);

            var result = await _fixture.workoutController.Delete(workout.Id);

            _fixture.mockWorkoutRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockWorkoutRepo.Verify(x => x.Delete(It.IsAny<Workout>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        public void Dispose()
        {
            _fixture.mockWorkoutRepo.Invocations.Clear();
        }
    }
}
