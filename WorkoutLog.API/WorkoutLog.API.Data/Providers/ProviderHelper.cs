namespace WorkoutLog.API.Data.Providers
{
    public class ProviderHelper
    {
        public static IProvider GetProvider(string providerName)
        {
            if (string.Equals(providerName, "Dapper", StringComparison.InvariantCultureIgnoreCase))
                return new SqlServerProvider();

            return null;
        }
    }
}
