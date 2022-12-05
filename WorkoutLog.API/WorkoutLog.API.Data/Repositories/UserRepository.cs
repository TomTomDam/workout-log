using Microsoft.Extensions.Options;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;
using static Dapper.SqlMapper;

namespace WorkoutLog.API.Data.Repositories
{
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        public readonly string _connectionString;

        public UserRepository(IOptions<DatabaseSettings> settings) : base(settings)
        {
            _connectionString = settings.Value.ConnectionString;
        }
    }
}
