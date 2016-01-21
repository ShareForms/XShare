namespace XShare.Data
{
    using System;
    using System.Collections.Generic;
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

        public static XShareDbContext Create()
        {
            return new XShareDbContext();
        }
    }
}
