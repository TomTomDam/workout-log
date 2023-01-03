using Dapper;
using Microsoft.Extensions.Options;
using System.Data;
using System.Reflection;
using WorkoutLog.API.Data.Models;
using WorkoutLog.API.Data.Providers;
using WorkoutLog.API.Data.Repositories.Interfaces;

namespace WorkoutLog.API.Data.Repositories
{
    public class BaseRepository<T> : IBaseRepository<T> where T : Entity
    {
        private readonly IProvider _provider;
        private readonly IDbConnection _connection;

        public BaseRepository(IOptions<DatabaseSettings> options)
        {
            if (string.IsNullOrEmpty(options.Value.ConnectionStrings.DefaultConnection)
                || string.IsNullOrWhiteSpace(options.Value.ConnectionStrings.DefaultConnection)
                || string.IsNullOrEmpty(options.Value.ProviderName)
                || string.IsNullOrWhiteSpace(options.Value.ProviderName))
                throw new ArgumentException("ConnectionString or Provider cannot be empty.");

            _provider = ProviderHelper.GetProvider(options.Value.ProviderName);
            if (_provider == null)
                throw new ArgumentException("A valid Provider must be specified.");

            _connection = _provider.CreateConnection(options.Value.ConnectionStrings.DefaultConnection);
        }

        protected virtual IDictionary<string, object> GetParameters<TItem>(IEnumerable<TItem> items)
        {
            if (items == null || !items.Any()) return null;

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

        public virtual async Task<IEnumerable<T>> GetAll()
        {
            string commandText = _provider.SelectQuery<T>(typeof(T).Name);

            return await _connection.QueryAsync<T>(commandText);
        }

        public virtual async Task<T> GetById(int id)
        {
            string commandText = _provider.SelectByIdQuery<T>(typeof(T).Name);

            return await _connection.QuerySingleOrDefaultAsync<T>(commandText, new { @Id = id });
        }

        public virtual async Task Insert(T entity)
        {
            if (entity == null)
            {
                await Task.CompletedTask;
                return;
            }

            _connection.Open();
            using var transaction = _connection.BeginTransaction();
            try
            {
                string commandText = _provider.InsertQuery(typeof(T).Name, entity);

                await _connection.ExecuteAsync(commandText, entity, transaction);
                transaction.Commit();
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                throw;
            }
        }

        public virtual async Task<bool> Update(T entity)
        {
            if (entity == null)
            {
                await Task.CompletedTask;
                return false;
            }

            _connection.Open();
            using var transaction = _connection.BeginTransaction();
            try
            {
                string commandText = _provider.UpdateQuery(typeof(T).Name, entity);

                int rows = await _connection.ExecuteAsync(commandText, entity, transaction);
                transaction.Commit();

                return true;
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                return false;
            }
        }

        public virtual async Task<bool> Delete(T entity)
        {
            if (entity == null)
            {
                await Task.CompletedTask;
                return false;
            }

            _connection.Open();
            using var transaction = _connection.BeginTransaction();
            try
            {
                string commandText = _provider.DeleteQuery(typeof(T).Name);

                int rows = await _connection.ExecuteAsync(commandText, new { entity.Id }, transaction);
                transaction.Commit();

                return true;
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                return false;
            }
        }
    }
}
