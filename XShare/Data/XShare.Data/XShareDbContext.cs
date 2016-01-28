namespace XShare.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data.Entity;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Models;

    public class XShareDbContext : IdentityDbContext<User>, IXShareDbContext
    {
        public XShareDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public virtual IDbSet<Car> Cars { get; set; }

        public virtual IDbSet<Rating> Ratings { get; set; }

        public virtual IDbSet<Reservation> Reservations { get; set; }

        public virtual IDbSet<Accident> Accidents { get; set; }

        public virtual IDbSet<Feature> Features { get; set; }

        public static XShareDbContext Create()
        {
            return new XShareDbContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder
                .Entity<User>()
                .HasMany(x => x.Reservations)
                .WithRequired(x => x.User)
                .WillCascadeOnDelete(true);

            base.OnModelCreating(modelBuilder);
        }
    }
}
