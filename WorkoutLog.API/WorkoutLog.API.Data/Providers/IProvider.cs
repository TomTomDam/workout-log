using Microsoft.Data.SqlClient;
using System.Linq.Expressions;

namespace WorkoutLog.API.Data.Providers
{
    public interface IProvider
    {
        SqlConnection CreateConnection(string connectionString);
        Task<string> SelectQuery<T>(Expression<Func<T, bool>> expression, string tableName);
        Task<string> SelectSingleQuery<T>(Expression<Func<T, bool>> expression, string tableName);
        Task<string> InsertQuery(string tableName, object entity);
        Task<string> InsertBulkQuery(string tableName, IEnumerable<object> entities);
        Task<string> UpdateQuery(string tableName, object entity);
        Task<string> UpdateBulkQuery(string tableName, IEnumerable<object> entities);
        Task<string> DeleteQuery(string tableName);
        Task<string> DeleteBulkQuery(string tableName);
    }
}
