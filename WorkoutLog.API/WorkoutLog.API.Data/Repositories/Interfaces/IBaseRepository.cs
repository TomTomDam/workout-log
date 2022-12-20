using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Data.Repositories.Interfaces
{
    public interface IBaseRepository<T> where T : Entity
    {
        Task<IEnumerable<T>> GetAll();
        Task<T> GetById(int id);
        Task Insert(T entity);
        Task<bool> Update(T entity);
        Task<bool> Delete(T entity);
    }
}
