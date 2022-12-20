namespace WorkoutLog.API.Data.Providers
{
    public class ProviderHelper
    {
        private const string Sqlite = "sqlite";

        public static IProvider GetProvider(string providerName)
        {
            if (string.Equals(providerName, Sqlite, StringComparison.InvariantCultureIgnoreCase))
                return new SqliteProvider();

            return null;
        }
    }
}
