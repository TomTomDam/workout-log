using Microsoft.Data.SqlClient;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Repositories;
using WorkoutLog.API.Data.Repositories.Interfaces;

var builder = WebApplication.CreateBuilder(args);

var databaseSettings = builder.Configuration.GetSection("DatabaseSettings");
builder.Services.Configure<DatabaseSettings>(databaseSettings);

var connectionString = databaseSettings.GetConnectionString("DefaultConnection");
builder.Services.AddTransient((sc) => new SqlConnection(connectionString));

builder.Services.AddTransient<IUserRepository, UserRepository>();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
