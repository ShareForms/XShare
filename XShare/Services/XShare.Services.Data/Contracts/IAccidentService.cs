namespace XShare.Services.Data.Contracts
{
    using System;
    using XShare.Data.Models;

    public interface IAccidentService
    {
        Accident CreateAccident(string location, string picture, string description, int carId, string userId);

        Accident AccidentById(int id);
    }
}
