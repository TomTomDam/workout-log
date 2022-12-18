namespace WorkoutLog.API.Data
{
    public class DatabaseSettings
    {
        public ConnectionStrings ConnectionStrings { get; set; } = new ConnectionStrings();
        public string ProviderName { get; set; } = "";
    }

    public class ConnectionStrings
    {
        public string DefaultConnection { get; set; } = "";
    }
}