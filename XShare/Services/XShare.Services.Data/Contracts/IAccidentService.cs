namespace XShare.Services.Data.Contracts
{
    using System;
    using System.Linq;
    using XShare.Data.Models;

    public interface IAccidentService
    {
        IQueryable<Accident> AllAccident();

        Accident CreateAccident(
            string location,
            string picture,
            string description,
            int carId,
            string userId);

        Accident AccidentById(int id);

        void DeleteById(int id);

        Accident GetById(int id);

        void UpadteAccident(Accident accidentToUpdate);

        IQueryable<Accident> GetFiltered(
            int? id,
            string userName,
            string model,
            string carType,
            string location,
            string descriptipn);
    }
}
