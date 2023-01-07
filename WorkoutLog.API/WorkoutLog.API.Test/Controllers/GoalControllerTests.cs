using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Tests.Fixtures.Controllers;

namespace WorkoutLog.API.Tests.Controllers
{
    public class GoalControllerTests : IClassFixture<GoalControllerFixture>, IDisposable
    {
        GoalControllerFixture _fixture;

        public GoalControllerTests(GoalControllerFixture fixture)
        {
            _fixture = fixture;
        }

        #region GetAll
        [Fact]
        public async Task GetAll_OkResponse_ReturnsListOfGoals()
        {
            var goalList = _fixture.fixture.Create<IEnumerable<Goal>>();

            _fixture.mockGoalRepo.Setup(x => x.GetAll()).ReturnsAsync(goalList);

            var result = await _fixture.goalController.GetAll();
            var okResult = result as OkObjectResult;

            _fixture.mockGoalRepo.Verify(x => x.GetAll(), Times.Once);

            Assert.IsType<OkObjectResult>(result);
            Assert.Equal(goalList, okResult?.Value);
        }
        #endregion

        #region GetByID
        [Fact]
        public async Task GetById_OkResponse_ReturnsGoal()
        {
            var goal = _fixture.fixture.Create<Goal>();

            _fixture.mockGoalRepo.Setup(x => x.GetById(goal.Id)).ReturnsAsync(goal);

            var result = await _fixture.goalController.GetById(goal.Id);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetById_NotFoundResponse_WhenGoalIsNotFound()
        {
            _fixture.mockGoalRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Goal)null);

            var result = await _fixture.goalController.GetById(1);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<NotFoundResult>(result);
        }
        #endregion

        #region Create
        [Fact]
        public async Task Create_OkResponse_CreatesGoal()
        {
            var goal = _fixture.fixture.Create<Goal>();

            _fixture.mockGoalRepo.Setup(x => x.Insert(goal));

            var result = await _fixture.goalController.Create(goal);

            _fixture.mockGoalRepo.Verify(x => x.Insert(It.IsAny<Goal>()), Times.Once);

            Assert.IsType<OkResult>(result);
        }
        #endregion

        #region Update
        [Fact]
        public async Task Update_NoContentResponse_UpdatesGoal()
        {
            var id = 1;
            var existingGoal = new Goal
            {
                Id = id,
                CurrentValue = 5
            };
            var newGoal = new Goal
            {
                Id = id,
                CurrentValue = 6
            };

            _fixture.mockGoalRepo.Setup(x => x.GetById(id)).ReturnsAsync(existingGoal);
            _fixture.mockGoalRepo.Setup(x => x.Update(newGoal)).ReturnsAsync(true);

            var result = await _fixture.goalController.Update(id, newGoal);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockGoalRepo.Verify(x => x.Update(It.IsAny<Goal>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Update_NotFoundResponse_WhenGoalIsNotFound()
        {
            var goal = _fixture.fixture.Create<Goal>();

            _fixture.mockGoalRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Goal)null);

            var result = await _fixture.goalController.Update(goal.Id, goal);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockGoalRepo.Verify(x => x.Update(It.IsAny<Goal>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Update_BadRequestResponse_WhenGoalIsNotUpdated()
        {
            var goal = _fixture.fixture.Create<Goal>();

            _fixture.mockGoalRepo.Setup(x => x.GetById(goal.Id)).ReturnsAsync(goal);
            _fixture.mockGoalRepo.Setup(x => x.Update(goal)).ReturnsAsync(false);

            var result = await _fixture.goalController.Update(goal.Id, goal);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockGoalRepo.Verify(x => x.Update(It.IsAny<Goal>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        #region Delete
        [Fact]
        public async Task Delete_NoContentResponse_DeletesGoal()
        {
            var goal = _fixture.fixture.Create<Goal>();

            _fixture.mockGoalRepo.Setup(x => x.GetById(goal.Id)).ReturnsAsync(goal);
            _fixture.mockGoalRepo.Setup(x => x.Delete(goal)).ReturnsAsync(true);

            var result = await _fixture.goalController.Delete(goal.Id);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockGoalRepo.Verify(x => x.Delete(It.IsAny<Goal>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Delete_NotFoundResponse_WhenGoalIsNotFound()
        {
            var goal = _fixture.fixture.Create<Goal>();

            _fixture.mockGoalRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((Goal)null);

            var result = await _fixture.goalController.Delete(goal.Id);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockGoalRepo.Verify(x => x.Delete(It.IsAny<Goal>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Delete_BadRequestResponse_WhenGoalIsNotDeleted()
        {
            var goal = _fixture.fixture.Create<Goal>();

            _fixture.mockGoalRepo.Setup(x => x.GetById(goal.Id)).ReturnsAsync(goal);
            _fixture.mockGoalRepo.Setup(x => x.Delete(goal)).ReturnsAsync(false);

            var result = await _fixture.goalController.Delete(goal.Id);

            _fixture.mockGoalRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockGoalRepo.Verify(x => x.Delete(It.IsAny<Goal>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        public void Dispose()
        {
            _fixture.mockGoalRepo.Invocations.Clear();
        }
    }
}
