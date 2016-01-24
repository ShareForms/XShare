namespace XShare.Data.DataSeed
{
    public interface IDataSeeder
    {
        void Seed(XShareDbContext context);
    }
}
