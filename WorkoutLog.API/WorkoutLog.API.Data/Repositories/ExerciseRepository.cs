using Microsoft.Extensions.Options;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Data.Repositories
{
    public class ExerciseRepository : BaseRepository<Exercise>, IExerciseRepository
    {
        public ExerciseRepository(IOptions<DatabaseSettings> options) : base(options)
        {
        }
    }
}
