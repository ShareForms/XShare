namespace XShare.Services.Data
{
    using System.Linq;
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

        public IQueryable<User> GetAll()
        {
            return this.users.All();
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

        public void UpdateUser(User userToUpdate)
        {
            this.users.Update(userToUpdate);

            this.users.SaveChanges();
        }

        public User GetById(string userId)
        {
            return this.users.GetById(userId);
        }

        public IQueryable<User> GetFiltered(string id, string userName, string email, string phone, string role)
        {
            var usersQuery = this.users.All();

            if (!string.IsNullOrEmpty(id))
            {
                usersQuery = usersQuery.Where(c => c.Id == id);
            }

            if (!string.IsNullOrEmpty(userName))
            {
                usersQuery = usersQuery.Where(c => c.UserName.Contains(userName));
            }

            if (!string.IsNullOrEmpty(email))
            {
                usersQuery = usersQuery.Where(c => c.Email.Contains(email));
            }

            if (!string.IsNullOrEmpty(phone))
            {
                usersQuery = usersQuery.Where(c => c.PhoneNumber.Contains(phone));
            }

            if (!string.IsNullOrEmpty(role))
            {
                if (role == "admin")
                {
                    usersQuery = usersQuery.Where(c => c.Roles.Any());
                }
                else
                {
                    usersQuery = usersQuery.Where(c => !c.Roles.Any());
                }
            }

            return usersQuery;
        }

        public void DeleteById(string id)
        {
            User itemToDelet = this.users.GetById(id);

            if (itemToDelet != null)
            {
                this.users.Delete(itemToDelet);

                this.users.SaveChanges();
            }
        }
    }
}
