using Microsoft.EntityFrameworkCore;
using WorkoutLog.API.Data;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<WorkoutLogDBContext>(options => options.UseSqlite(builder.Configuration.GetConnectionString("DefaultConnection"),
                                                                                opt => opt.MigrationsAssembly("WorkoutLog.API.Data")));

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
