using Microsoft.Data.SqlClient;
using System.Linq.Expressions;

namespace WorkoutLog.API.Data.Providers
{
    internal class SqliteProvider : IProvider
    {
        private SqlConnection _connection = new SqlConnection();

        public SqlConnection CreateConnection(string connectionString)
        {
            _connection = new SqlConnection(connectionString);

            return _connection;
        }

        public async Task<string> SelectQuery<T>(Expression<Func<T, bool>> expression, string tableName)
        {
            return $"SELECT * FROM {tableName}";
        }

        public async Task<string> SelectSingleQuery<T>(Expression<Func<T, bool>> expression, string tableName)
        {
            throw new NotImplementedException();
        }

        public async Task<string> InsertQuery(string tableName, object entity)
        {
            throw new NotImplementedException();
        }

        public async Task<string> InsertBulkQuery(string tableName, IEnumerable<object> entities)
        {
            throw new NotImplementedException();
        }

        public async Task<string> UpdateQuery(string tableName, object entity)
        {
            throw new NotImplementedException();
        }

        public async Task<string> UpdateBulkQuery(string tableName, IEnumerable<object> entities)
        {
            throw new NotImplementedException();
        }

        public async Task<string> DeleteQuery(string tableName)
        {
            throw new NotImplementedException();
        }

        public async Task<string> DeleteBulkQuery(string tableName)
        {
            throw new NotImplementedException();
        }
    }
}
