namespace XShare.WebForms
{   
    using System.Data.Entity;
    using Data;
    using XShare.Data.Migrations;

    public class DatabaseConfig
    {
        public static void Initialize()
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<XShareDbContext, Configuration>());
            XShareDbContext.Create().Database.Initialize(true);
        }
    }
}