namespace XShare.Data.DataSeed
{
    using System.Data.Entity.Migrations;
    using XShare.Data.Models;

    public class FeaturesSeeder : IDataSeeder
    {
        public void Seed(XShareDbContext context)
        {
            context.Features.AddOrUpdate(f => f.Id,
               new Feature() { Id = 1, Value = "Automatic Transmission" },
               new Feature() { Id = 2, Value = "Cabriolet" },
               new Feature() { Id = 3, Value = "Cruise control" },
               new Feature() { Id = 4, Value = "Navigation system" },
               new Feature() { Id = 5, Value = "Xenon headlights" },
               new Feature() { Id = 6, Value = "Ventilated Seats" });
        }
    }
}
