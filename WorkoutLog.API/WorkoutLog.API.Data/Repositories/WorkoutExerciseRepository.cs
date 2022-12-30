using Microsoft.Extensions.Options;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Data.Repositories
{
    public class WorkoutExerciseRepository : BaseRepository<WorkoutExercise>, IWorkoutExerciseRepository
    {
        public WorkoutExerciseRepository(IOptions<DatabaseSettings> options) : base(options)
        {
        }
    }
}
