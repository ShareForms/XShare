namespace XShare.Services.Data.Contracts
{
    using System.Linq;
    using XShare.Data.Models;

    public interface IUserService
    {
        IQueryable<User> AllByName(string name);

        IQueryable<User> GetAll();

        string GetUserId(string name);

        int GetLastCarId(string name);

        int UserCount();

        void UpdateUser(User userToUpdate);

        User GetById(string userId);

        IQueryable<User> GetFiltered(string id, string userName, string email, string phone);

        void DeleteById(string id);
    }
}
