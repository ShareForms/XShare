namespace XShare.Services.Data
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using XShare.Data.Models;
    using XShare.Data.Repositories;
    using XShare.Services.Data.Contracts;

    public class UserService : IUserService
    {
        private readonly IRepository<User> users;

        public UserService(IRepository<User> users)
        {
            this.users = users;
        }

        public IQueryable<User> AllByName(string name)
        {
            return this.users
               .All()
               .Where(x => x.UserName == name);
        }

        public int GetLastCarId(string name)
        {
            var reservationAsObject = this.users
               .All()
               .Where(x => x.UserName == name)
               .Select(r => r.Reservations.OrderByDescending(d => d.ToTime).FirstOrDefault())
               .FirstOrDefault();

            return reservationAsObject.CarId;
        }

        public string GetUserId(string name)
        {
            var userAsObject = this.users
               .All()
               .Where(x => x.UserName == name)
               .FirstOrDefault();

            return userAsObject.Id;
        }

        public int UserCount()
        {
            return this.users.All().Count();
        }
    }
}
