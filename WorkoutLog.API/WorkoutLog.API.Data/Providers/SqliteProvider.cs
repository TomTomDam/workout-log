using Microsoft.Data.Sqlite;
using System.Data;
using System.Reflection;
using System.Text;

namespace WorkoutLog.API.Data.Providers
{
    internal class SqliteProvider : IProvider
    {
        private const string _insertQuery = "INSERT INTO [{0}]({1}) VALUES(@{2}) RETURNING Id";
        private const string _insertBulkQuery = "INSERT INTO [{0}]({1}) VALUES ({2})\r\n";
        private const string _updateQuery = "UPDATE [{0}] SET {1} WHERE [Id] = @Id";
        private const string _updateBulkQuery = "UPDATE [{0}] SET {1} WHERE [Id] = @Id\r\n";
        private const string _deleteQuery = "DELETE FROM [{0}] WHERE [Id] = @Id";
        private const string _deleteBulkQuery = "DELETE FROM [{0}] WHERE [Id] IN(@Ids)";
        private const string _selectQuery = "SELECT\r\n {1} FROM [{0}]";
        private const string _selectByIdQuery = "SELECT\r\n {1} FROM [{0}] WHERE [Id] = @Id";

        private SqliteConnection _connection = new SqliteConnection();

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

        public IDbConnection CreateConnection(string connectionString)
        {
            _connection = new SqliteConnection(connectionString);

            return _connection;
        }

        public string SelectQuery<T>(string tableName)
        {
            var columns = GetColumns(typeof(T)).Select(p => string.Format("[{0}].[{1}]", tableName, p));

            return string.Format(_selectQuery,
                                tableName,
                                string.Join(",\r\n", columns));
        }

        public string SelectByIdQuery<T>(string tableName)
        {
            var columns = GetColumns(typeof(T)).Select(p => string.Format("[{0}].[{1}]", tableName, p));

            return string.Format(_selectByIdQuery,
                                tableName,
                                string.Join(",\r\n", columns));
        }

        public string InsertQuery(string tableName, object entity)
        {
            var columns = GetColumnsWithoutIdentity(entity.GetType());

            return string.Format(_insertQuery,
                                 tableName,
                                 string.Join(", ", columns.Select(p => string.Format("[{0}]", p))),
                                 string.Join(", @", columns));
        }

        public string InsertBulkQuery(string tableName, IEnumerable<object> entities)
        {
            if (!entities.Any())
                throw new ArgumentException("Collection is empty");

            var stringBuilder = new StringBuilder();
            var columns = GetColumnsWithoutIdentity(entities.First().GetType());
            string formattedColumns = string.Join(", ", columns.Select(p => string.Format("[{0}]", p)));

            for (int i = 0; i < entities.Count(); i++)
            {
                if (i != 0 && i % 100 == 0)
                    stringBuilder.Append("GO\r\n");

                var valueColumns = columns.Select(p => string.Format("@{0}{1}", p, i + 1));
                stringBuilder.AppendFormat(_insertBulkQuery,
                                           tableName,
                                           formattedColumns,
                                           string.Join(", ", valueColumns));
            }

            return stringBuilder.ToString();
        }

        public string UpdateQuery(string tableName, object entity)
        {
            var columns = GetColumnsWithoutIdentity(entity.GetType());
            string formattedColumns = string.Join(", ", columns.Select(p => string.Format("[{0}] = @{0}", p)));

            return string.Format(_updateQuery,
                                 tableName,
                                 formattedColumns);
        }

        public string UpdateBulkQuery(string tableName, IEnumerable<object> entities)
        {
            if (!entities.Any())
                throw new ArgumentException("Collection is empty");

            object[] entityArray = entities.ToArray();

            var stringBuilder = new StringBuilder();
            var columns = GetColumnsWithoutIdentity(entityArray[0].GetType());

            for (int i = 0; i < entityArray.Length; i++)
            {
                if (i != 0 && i % 100 == 0)
                    stringBuilder.Append("GO\r\n");

                var formattedColumns = columns.Select(p => string.Format("[{0}] = @{0}{1}", p, i + 1));
                stringBuilder.AppendFormat(_updateBulkQuery,
                                           tableName,
                                           string.Join(", ", formattedColumns));
            }

            return stringBuilder.ToString();
        }

        public string DeleteQuery(string tableName)
        {
            return string.Format(_deleteQuery, tableName);
        }

        public string DeleteBulkQuery(string tableName)
        {
            return string.Format(_deleteBulkQuery, tableName);
        }
    }
}
