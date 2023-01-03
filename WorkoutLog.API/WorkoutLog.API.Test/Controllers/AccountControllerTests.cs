using AutoFixture;
using Microsoft.AspNetCore.Mvc;
using Moq;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Tests.Fixtures.Controllers;

namespace WorkoutLog.API.Tests.Controllers
{
    public class AccountControllerTests : IClassFixture<AccountControllerFixture>, IDisposable
    {
        AccountControllerFixture _fixture;

        public AccountControllerTests(AccountControllerFixture fixture)
        {
            _fixture = fixture;
        }

        #region GetAll
        [Fact]
        public async Task GetAll_OkResponse_ReturnsListOfUsers()
        {
            var userList = _fixture.fixture.Create<IEnumerable<User>>();

            _fixture.mockUserRepo.Setup(x => x.GetAll()).ReturnsAsync(userList);

            var result = await _fixture.accountController.GetAll();
            var okResult = result as OkObjectResult;

            _fixture.mockUserRepo.Verify(x => x.GetAll(), Times.Once);

            Assert.IsType<OkObjectResult>(result);
            Assert.Equal(userList, okResult?.Value);
        }
        #endregion

        #region GetByID
        [Fact]
        public async Task GetById_OkResponse_ReturnsUser()
        {
            var user = _fixture.fixture.Create<User>();

            _fixture.mockUserRepo.Setup(x => x.GetById(user.Id)).ReturnsAsync(user);

            var result = await _fixture.accountController.GetById(user.Id);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<OkObjectResult>(result);
        }

        [Fact]
        public async Task GetById_NotFoundResponse_WhenUserIsNotFound()
        {
            _fixture.mockUserRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((User)null);

            var result = await _fixture.accountController.GetById(1);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);

            Assert.IsType<NotFoundResult>(result);
        }
        #endregion

        #region Create
        [Fact]
        public async Task Create_OkResponse_CreatesUser()
        {
            var user = _fixture.fixture.Create<User>();

            _fixture.mockUserRepo.Setup(x => x.Insert(user));

            var result = await _fixture.accountController.Create(user);

            _fixture.mockUserRepo.Verify(x => x.Insert(It.IsAny<User>()), Times.Once);

            Assert.IsType<OkResult>(result);
        }
        #endregion

        #region Update
        [Fact]
        public async Task Update_NoContentResponse_UpdatesUser()
        {
            var id = 1;
            var existingUser = new User
            {
                Id = id,
                Name = "Jane Shepard"
            };
            var newUser = new User
            {
                Id = id,
                Name = "John Shepard"
            };

            _fixture.mockUserRepo.Setup(x => x.GetById(id)).ReturnsAsync(existingUser);
            _fixture.mockUserRepo.Setup(x => x.Update(newUser)).ReturnsAsync(true);

            var result = await _fixture.accountController.Update(id, newUser);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockUserRepo.Verify(x => x.Update(It.IsAny<User>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Update_NotFoundResponse_WhenUserIsNotFound()
        {
            var user = _fixture.fixture.Create<User>();

            _fixture.mockUserRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((User)null);

            var result = await _fixture.accountController.Update(user.Id, user);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockUserRepo.Verify(x => x.Update(It.IsAny<User>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Update_BadRequestResponse_WhenUserIsNotUpdated()
        {
            var user = _fixture.fixture.Create<User>();

            _fixture.mockUserRepo.Setup(x => x.GetById(user.Id)).ReturnsAsync(user);
            _fixture.mockUserRepo.Setup(x => x.Update(user)).ReturnsAsync(false);

            var result = await _fixture.accountController.Update(user.Id, user);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockUserRepo.Verify(x => x.Update(It.IsAny<User>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        #region Delete
        [Fact]
        public async Task Delete_NoContentResponse_DeletesUser()
        {
            var user = _fixture.fixture.Create<User>();

            _fixture.mockUserRepo.Setup(x => x.GetById(user.Id)).ReturnsAsync(user);
            _fixture.mockUserRepo.Setup(x => x.Delete(user)).ReturnsAsync(true);

            var result = await _fixture.accountController.Delete(user.Id);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockUserRepo.Verify(x => x.Delete(It.IsAny<User>()), Times.Once);

            Assert.IsType<NoContentResult>(result);
        }

        [Fact]
        public async Task Delete_NotFoundResponse_WhenUserIsNotFound()
        {
            var user = _fixture.fixture.Create<User>();

            _fixture.mockUserRepo.Setup(x => x.GetById(It.IsAny<int>())).ReturnsAsync((User)null);

            var result = await _fixture.accountController.Delete(user.Id);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockUserRepo.Verify(x => x.Delete(It.IsAny<User>()), Times.Never);

            Assert.IsType<NotFoundResult>(result);
        }

        [Fact]
        public async Task Delete_BadRequestResponse_WhenUserIsNotDeleted()
        {
            var user = _fixture.fixture.Create<User>();

            _fixture.mockUserRepo.Setup(x => x.GetById(user.Id)).ReturnsAsync(user);
            _fixture.mockUserRepo.Setup(x => x.Delete(user)).ReturnsAsync(false);

            var result = await _fixture.accountController.Delete(user.Id);

            _fixture.mockUserRepo.Verify(x => x.GetById(It.IsAny<int>()), Times.Once);
            _fixture.mockUserRepo.Verify(x => x.Delete(It.IsAny<User>()), Times.Once);

            Assert.IsType<BadRequestResult>(result);
        }
        #endregion

        public void Dispose()
        {
            _fixture.mockUserRepo.Invocations.Clear();
        }
    }
}
