using System.Data;

namespace WorkoutLog.API.Data.Providers
{
    public interface IProvider
    {
        IDbConnection CreateConnection(string connectionString);
        string SelectQuery<T>(string tableName);
        string SelectSingleQuery<T>(string tableName);
        string InsertQuery(string tableName, object entity);
        string InsertBulkQuery(string tableName, IEnumerable<object> entities);
        string UpdateQuery(string tableName, object entity);
        string UpdateBulkQuery(string tableName, IEnumerable<object> entities);
        string DeleteQuery(string tableName);
        string DeleteBulkQuery(string tableName);
    }
}
