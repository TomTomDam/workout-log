using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Models;

namespace WorkoutLog.API.Repositories
{
    public class UserRepository : IRepository<User>
    {
        private WorkoutLogDBContext _context;

        public UserRepository(WorkoutLogDBContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<User>> GetAll()
        {
            return await _context.User.ToListAsync();
        }

        public async Task<User> GetById(int id)
        {
            var user = await _context.User.FindAsync(id);
            if (user == null) return null;

            return user;
        }

        public async Task Insert(User entity)
        {
            await _context.User.AddAsync(entity);
            await Save();
        }

        public async Task Update(User entity)
        {
            var existingUser = await _context.User.FindAsync(entity.Id);
            if (existingUser == null)
            {
                await Task.CompletedTask;
                return;
            }

            existingUser.Name = entity.Name;
            existingUser.Age = entity.Age;
            existingUser.Bodyweight = entity.Bodyweight;
            existingUser.Gender = entity.Gender;
            existingUser.TrainingStyles = entity.TrainingStyles;

            _context.Update(existingUser);
            await Save();
        }

        public async Task Delete(int id)
        {
            var user = await _context.User.FindAsync(id);
            if (user == null) 
            {
                await Task.CompletedTask;
                return;
            } 

            _context.User.Remove(user);
            await Save();
        }

        public async Task Save()
        {
            await _context.SaveChangesAsync();
        }
    }
}
