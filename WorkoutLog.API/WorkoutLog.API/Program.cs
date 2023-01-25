using Microsoft.Data.Sqlite;
using Serilog;
using Serilog.Events;
using WorkoutLog.API;
using WorkoutLog.API.Data;
using WorkoutLog.API.Data.Repositories;
using WorkoutLog.API.Data.Repositories.Interfaces;

var builder = WebApplication.CreateBuilder(args);

var databaseSettings = builder.Configuration.GetSection("DatabaseSettings");
builder.Services.Configure<DatabaseSettings>(databaseSettings);

var connectionString = databaseSettings.GetConnectionString("DefaultConnection");
builder.Services.AddTransient((sp) => new SqliteConnection(connectionString));

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json")
    .AddJsonFile($"appsettings.{Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") ?? "Production"}.json", true)
    .Build();
Log.Logger = new LoggerConfiguration()
    .ReadFrom.Configuration(configuration)
    .WriteTo.SQLite(
        sqliteDbPath: "D:\\SQLite\\WorkoutLog.db",
        tableName: "Logs"
    )
    .CreateLogger();
builder.Host.UseSerilog();

builder.Services.AddTransient<IUserRepository, UserRepository>();
builder.Services.AddTransient<IEquipmentRepository, EquipmentRepository>();
builder.Services.AddTransient<IExerciseRepository, ExerciseRepository>();
builder.Services.AddTransient<IGoalRepository, GoalRepository>();
builder.Services.AddTransient<IWorkoutRepository, WorkoutRepository>();
builder.Services.AddTransient<IWorkoutExerciseRepository, WorkoutExerciseRepository>();

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

try
{
    var app = builder.Build();

    // Configure the HTTP request pipeline.
    if (app.Environment.IsDevelopment())
    {
    }

    app.UseSerilogRequestLogging();

    app.UseHttpsRedirection();

    app.UseAuthentication();
    app.UseAuthorization();

    app.MapControllers();

    app.Run();

}
catch (Exception ex)
{
    Log.Fatal(ex, "Application startup failed");
}
finally
{
    Log.CloseAndFlush();
}