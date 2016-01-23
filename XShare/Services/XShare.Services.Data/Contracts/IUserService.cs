namespace XShare.Services.Data.Contracts
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using XShare.Data.Models;

    public interface IUserService
    {
        IQueryable<User> AllByName(string name);

        string GetUserId(string name);

        int GetLastCarId(string name);
    }
}
