using Microsoft.Extensions.Options;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Data.Repositories
{
    public class UserRepository : BaseRepository<User>
    {
        public UserRepository(IOptions<DatabaseSettings> options) : base(options)
        {
        }
    }
}
