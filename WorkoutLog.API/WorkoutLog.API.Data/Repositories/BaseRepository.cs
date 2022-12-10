using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Tokens;
using System.Reflection;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Data.Repositories
{
    public class BaseRepository<T> : IBaseRepository<T> where T : TEntity
    {
        protected SqlTransaction Transaction { get; private set; }
        protected SqlConnection Connection { get { return Transaction.Connection; } }
        private string _tableName = typeof(T).Name;
        private const string _insertQuery = "INSERT INTO [{0}]({1}) OUTPUT INSERTED.Id VALUES(@{2})";
        private const string _updateQuery = "UPDATE [{0}] SET {1} WHERE [{0}].[Id] = @Id";

        public BaseRepository(SqlTransaction transaction)
        {
            Transaction = transaction;
        }

        protected virtual IDictionary<string, object> GetParameters<TItem>(IEnumerable<TItem> items)
        {
            if (items.IsNullOrEmpty()) return null;

            var parameters = new Dictionary<string, object>();
            var entityArray = items.ToArray();
            var entityType = entityArray[0].GetType();
            for (int i = 0; i < entityArray.Length; i++)
            {
                var properties = entityArray[i].GetType().GetProperties(BindingFlags.Public | BindingFlags.Instance);
                properties = properties.Where(x => x.Name != "Id").ToArray();

                foreach (var property in properties)
                    parameters.Add(property.Name + (i + 1), entityType.GetProperty(property.Name).GetValue(entityArray[i], null));
            }

            return parameters;
        }

        protected virtual IEnumerable<string> GetColumns(Type entityType)
        {
            PropertyInfo[] props = entityType.GetProperties(BindingFlags.Public | BindingFlags.Instance);

            return props.Select(p => p.Name);
        }

        protected virtual IEnumerable<string> GetColumnsWithoutIdentity(Type entityType)
        {
            PropertyInfo[] props = entityType.GetProperties(BindingFlags.Public | BindingFlags.Instance);

            return props.Where(p => p.Name != "Id").Select(p => p.Name);
        }

        public async Task<IEnumerable<T>> GetAll()
        {
            return await Connection.QueryAsync<T>(
                $"SELECT * FROM {_tableName}",
                transaction: Transaction
            );
        }

        public async Task<T> GetById(int id)
        {
            return await Connection.QuerySingleOrDefaultAsync<T>(
                $"SELECT * FROM {_tableName} WHERE Id = @Id",
                param: new { Id = id },
                transaction: Transaction);
        }

        public async Task Insert(T entity)
        {
            if (entity == null)
            {
                await Task.CompletedTask;
                return;
            }

            var columns = GetColumnsWithoutIdentity(entity.GetType());
            var commandText = string.Format(_insertQuery,
                     _tableName,
                     string.Join(", ", columns.Select(p => string.Format("[{0}].[{1}]", _tableName, p))),
                     string.Join(", @", columns));

            await Connection.ExecuteScalarAsync<int>(commandText, entity, Transaction);
        }

        public async Task Update(T entity)
        {
            if (entity == null)
            {
                await Task.CompletedTask;
                return;
            }

            IEnumerable<string> columns = GetColumnsWithoutIdentity(entity.GetType());
            string formattedColumns = string.Join(", ", columns.Select(p => string.Format("[{0}].[{1}] = @{1}", _tableName, p)));
            var commandText = string.Format(_updateQuery,
                                 _tableName,
                                 formattedColumns);

            await Connection.ExecuteAsync(commandText, entity, Transaction);
        }

        public async Task Delete(int id)
        {
            await Connection.ExecuteAsync(
                $"DELETE FROM {_tableName} WHERE Id = @Id",
                param: new { Id = id },
                transaction: Transaction
            );
        }
    }
}
