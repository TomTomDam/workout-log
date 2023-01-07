using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Tests.Fixtures.Controllers;

namespace WorkoutLog.API.Tests.Controllers
{
    public class ExerciseControllerTests : IClassFixture<ExerciseControllerFixture>, IDisposable
    {
        ExerciseControllerFixture _fixture;

        public ExerciseControllerTests(ExerciseControllerFixture fixture)
        {
            _fixture = fixture;
        }

        #region GetAll
        [Fact]
        public async Task GetAll_OkResponse_ReturnsListOfExercises()
        {
            var exerciseList = _fixture.fixture.Create<IEnumerable<Exercise>>();

            _fixture.mockExerciseRepo.Setup(x => x.GetAll()).ReturnsAsync(exerciseList);

            var result = await _fixture.exerciseController.GetAll();
            var okResult = result as OkObjectResult;

            _fixture.mockExerciseRepo.Verify(x => x.GetAll(), Times.Once);

            Assert.IsType<OkObjectResult>(result);
            Assert.Equal(exerciseList, okResult?.Value);
        }
        #endregion

        #region GetByID
        [Fact]
        public async Task GetById_OkResponse_ReturnsExercise()
        {
            var exercise = _fixture.fixture.Create<Exercise>();

            _fixture.mockExerciseRepo.Setup(x => x.GetById(exercise.Id)).ReturnsAsync(exercise);

            var result = await _fixture.exerciseController.GetById(exercise.Id);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetById_NotFoundResponse_WhenExerciseIsNotFound()
        {
            _fixture.mockExerciseRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Exercise)null);

            var result = await _fixture.exerciseController.GetById(1);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<NotFoundResult>(result);
        }
        #endregion

        #region Create
        [Fact]
        public async Task Create_OkResponse_CreatesExercise()
        {
            var exercise = _fixture.fixture.Create<Exercise>();

            _fixture.mockExerciseRepo.Setup(x => x.Insert(exercise));

            var result = await _fixture.exerciseController.Create(exercise);

            _fixture.mockExerciseRepo.Verify(x => x.Insert(It.IsAny<Exercise>()), Times.Once);

            Assert.IsType<OkResult>(result);
        }
        #endregion

        #region Update
        [Fact]
        public async Task Update_NoContentResponse_UpdatesExercise()
        {
            var id = 1;
            var existingExercise = new Exercise
            {
                Id = id,
                Name = "Pull-up"
            };
            var newExercise = new Exercise
            {
                Id = id,
                Name = "Bench Press"
            };

            _fixture.mockExerciseRepo.Setup(x => x.GetById(id)).ReturnsAsync(existingExercise);
            _fixture.mockExerciseRepo.Setup(x => x.Update(newExercise)).ReturnsAsync(true);

            var result = await _fixture.exerciseController.Update(id, newExercise);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockExerciseRepo.Verify(x => x.Update(It.IsAny<Exercise>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Update_NotFoundResponse_WhenExerciseIsNotFound()
        {
            var exercise = _fixture.fixture.Create<Exercise>();

            _fixture.mockExerciseRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Exercise)null);

            var result = await _fixture.exerciseController.Update(exercise.Id, exercise);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockExerciseRepo.Verify(x => x.Update(It.IsAny<Exercise>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Update_BadRequestResponse_WhenExerciseIsNotUpdated()
        {
            var exercise = _fixture.fixture.Create<Exercise>();

            _fixture.mockExerciseRepo.Setup(x => x.GetById(exercise.Id)).ReturnsAsync(exercise);
            _fixture.mockExerciseRepo.Setup(x => x.Update(exercise)).ReturnsAsync(false);

            var result = await _fixture.exerciseController.Update(exercise.Id, exercise);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockExerciseRepo.Verify(x => x.Update(It.IsAny<Exercise>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        #region Delete
        [Fact]
        public async Task Delete_NoContentResponse_DeletesExercise()
        {
            var exercise = _fixture.fixture.Create<Exercise>();

            _fixture.mockExerciseRepo.Setup(x => x.GetById(exercise.Id)).ReturnsAsync(exercise);
            _fixture.mockExerciseRepo.Setup(x => x.Delete(exercise)).ReturnsAsync(true);

            var result = await _fixture.exerciseController.Delete(exercise.Id);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockExerciseRepo.Verify(x => x.Delete(It.IsAny<Exercise>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Delete_NotFoundResponse_WhenExerciseIsNotFound()
        {
            var exercise = _fixture.fixture.Create<Exercise>();

            _fixture.mockExerciseRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Exercise)null);

            var result = await _fixture.exerciseController.Delete(exercise.Id);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockExerciseRepo.Verify(x => x.Delete(It.IsAny<Exercise>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Delete_BadRequestResponse_WhenExerciseIsNotDeleted()
        {
            var exercise = _fixture.fixture.Create<Exercise>();

            _fixture.mockExerciseRepo.Setup(x => x.GetById(exercise.Id)).ReturnsAsync(exercise);
            _fixture.mockExerciseRepo.Setup(x => x.Delete(exercise)).ReturnsAsync(false);

            var result = await _fixture.exerciseController.Delete(exercise.Id);

            _fixture.mockExerciseRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockExerciseRepo.Verify(x => x.Delete(It.IsAny<Exercise>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        public void Dispose()
        {
            _fixture.mockExerciseRepo.Invocations.Clear();
        }
    }
}
