using System.Data;
using System.Linq.Expressions;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Data.Repositories.Interfaces
{
    public interface IBaseRepository<T> where T : BaseEntity
    {
        Task<IEnumerable<T>> GetAll(Expression<Func<T, bool>> expression);
        Task<T> GetById(int id);
        Task Insert(T entity, IDbTransaction transaction);
        Task<bool> Update(T entity, IDbTransaction transaction);
        Task<bool> Delete(T entity, IDbTransaction transaction);
    }
}
