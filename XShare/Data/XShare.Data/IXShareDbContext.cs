namespace XShare.Data
{
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using XShare.Data.Models;

    public interface IXShareDbContext
    {
        IDbSet<User> Users { get; set; }

        DbSet<TEntity> Set<TEntity>() where TEntity : class;

        DbEntityEntry<TEntity> Entry<TEntity>(TEntity entity) where TEntity : class;

        int SaveChanges();

        void Dispose();
    }
}
