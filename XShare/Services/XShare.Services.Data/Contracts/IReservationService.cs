namespace XShare.Services.Data.Contracts
{
    using System;
    using System.Linq;
    using XShare.Data.Models;

    public interface IReservationService
    {
        IQueryable<Reservation> AllReservationss();

        int ReservationCount();

        Reservation CreateReservation(
            DateTime fromTime,
            DateTime toTime,
            string fromLocation,
            string toLocation,
            int carId,
            string userId);

        Reservation GetById(int id);

        void DeleteById(int id);

        void UpdateReservation(Reservation item);

        IQueryable<Reservation> GetFiltered(string from, string to, string carModel, string userName);
    }
}