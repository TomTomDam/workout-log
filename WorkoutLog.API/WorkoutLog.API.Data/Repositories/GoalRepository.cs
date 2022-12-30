using Microsoft.Extensions.Options;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Data.Repositories
{
    public class GoalRepository : BaseRepository<Goal>, IGoalRepository
    {
        public GoalRepository(IOptions<DatabaseSettings> options) : base(options)
        {
        }
    }
}
