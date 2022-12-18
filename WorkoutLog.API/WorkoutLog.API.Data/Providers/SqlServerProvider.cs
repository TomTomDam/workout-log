using Microsoft.Data.SqlClient;
using System.Data;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;

namespace WorkoutLog.API.Data.Providers
{
    public class SqlServerProvider : IProvider
    {
        private const string _insertQuery = "INSERT INTO [{0}]({1}) OUTPUT INSERTED.Id VALUES(@{2})";
        private const string _insertBulkQuery = "INSERT INTO [{0}]({1}) VALUES ({2})\r\n";
        private const string _updateQuery = "UPDATE [{0}] SET {1} WHERE [{0}].[Id] = @Id";
        private const string _updateBulkQuery = "UPDATE [{0}] SET {1} WHERE [{0}].[Id] = @Id\r\n";
        private const string _deleteQuery = "DELETE FROM [{0}] WHERE [{0}].[Id] = @Id";
        private const string _deleteBulkQuery = "DELETE FROM [{0}] WHERE [{0}].[Id] IN(@Ids)";
        private const string _selectQuery = "SELECT\r\n {1} FROM [{0}]";
        private const string _selectSingleQuery = "SELECT TOP(1)\r\n{1} FROM [{0}]";

        private SqlConnection _connection = new SqlConnection();

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

        public SqlConnection CreateConnection(string connectionString)
        {
            _connection = new SqlConnection(connectionString);

            return _connection;
        }

        public async Task<string> SelectQuery<T>(Expression<Func<T, bool>> expression, string tableName)
        {
            IEnumerable<string> columns = GetColumns(typeof(T)).Select(p => string.Format("[{0}].[{1}]", tableName, p));

            string query = string.Format(_selectQuery,
                tableName,
                string.Join(",\r\n", columns));

            if (expression != null)
            {
                WhereClauseBuilder whereClauseBuilder = new WhereClauseBuilder();
                string whereClause = whereClauseBuilder.Translate(expression);

                if (!string.IsNullOrEmpty(whereClause))
                    query = string.Format("{0} WHERE {1}", query, whereClause);
            }

            return query;
        }

        public async Task<string> SelectSingleQuery<T>(Expression<Func<T, bool>> expression, string tableName)
        {
            IEnumerable<string> columns = GetColumns(typeof(T)).Select(p => string.Format("[{0}].[{1}]", tableName, p));

            string query = string.Format(_selectSingleQuery,
                tableName,
                string.Join(",\r\n", columns));

            if (expression != null)
            {
                WhereClauseBuilder whereClauseBuilder = new WhereClauseBuilder();
                string whereClause = whereClauseBuilder.Translate(expression);

                if (!string.IsNullOrEmpty(whereClause))
                    query = string.Format("{0} WHERE {1}", query, whereClause);
            }

            return query;
        }

        public async Task<string> InsertQuery(string tableName, object entity)
        {
            IEnumerable<string> columns = GetColumnsWithoutIdentity(entity.GetType());

            return string.Format(_insertQuery,
                                 tableName,
                                 string.Join(", ", columns.Select(p => string.Format("[{0}].[{1}]", tableName, p))),
                                 string.Join(", @", columns));
        }

        public async Task<string> InsertBulkQuery(string tableName, IEnumerable<object> entities)
        {
            if (!entities.Any())
                throw new ArgumentException("collection is empty");

            StringBuilder builder = new StringBuilder();
            IEnumerable<string> columns = GetColumnsWithoutIdentity(entities.First().GetType());
            string formattedColumns = string.Join(", ", columns.Select(p => string.Format("[{0}].[{1}]", tableName, p)));

            for (int i = 0; i < entities.Count(); i++)
            {
                if (i != 0 && i % 100 == 0)
                    builder.Append("GO\r\n");

                IEnumerable<string> valueColumns = columns.Select(p => string.Format("@{0}{1}", p, i + 1));
                builder.AppendFormat(_insertBulkQuery,
                                     tableName,
                                     formattedColumns,
                                     string.Join(", ", valueColumns));
            }

            return builder.ToString();
        }

        public async Task<string> UpdateQuery(string tableName, object entity)
        {
            IEnumerable<string> columns = GetColumnsWithoutIdentity(entity.GetType());
            string formattedColumns = string.Join(", ", columns.Select(p => string.Format("[{0}].[{1}] = @{1}", tableName, p)));

            return string.Format(_updateQuery,
                                 tableName,
                                 formattedColumns);
        }

        public async Task<string> UpdateBulkQuery(string tableName, IEnumerable<object> entities)
        {
            if (!entities.Any())
                throw new ArgumentException("collection is empty");

            object[] entityArray = entities.ToArray();

            StringBuilder builder = new StringBuilder();
            IEnumerable<string> columns = GetColumnsWithoutIdentity(entityArray[0].GetType());

            for (int i = 0; i < entityArray.Length; i++)
            {
                if (i != 0 && i % 100 == 0)
                    builder.Append("GO\r\n");

                IEnumerable<string> formattedColumns = columns.Select(p => string.Format("[{0}].[{1}] = @{1}{2}", tableName, p, i + 1));
                builder.AppendFormat(_updateBulkQuery,
                                     tableName,
                                     string.Join(", ", formattedColumns));
            }

            return builder.ToString();
        }

        public async Task<string> DeleteQuery(string tableName)
        {
            return string.Format(_deleteQuery, tableName);
        }

        public async Task<string> DeleteBulkQuery(string tableName)
        {
            return string.Format(_deleteBulkQuery, tableName);
        }
    }
}
