namespace XShare.Data.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using XShare.Data.DataSeed;
    using XShare.Data.Models;

    public sealed class Configuration : DbMigrationsConfiguration<XShareDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(XShareDbContext context)
        {
            new AdminSeeder().Seed(context);
            new FeaturesSeeder().Seed(context);
        }
    }
}
