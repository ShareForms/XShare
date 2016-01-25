namespace XShare.Services.Data.Contracts
{
    using System;
    using System.Linq;
    using XShare.Data.Models;

    public interface IAccidentService
    {
        IQueryable<Accident> AllAccident();

        Accident CreateAccident(string location, string picture, string description, int carId, string userId);

        Accident AccidentById(int id);
    }
}
