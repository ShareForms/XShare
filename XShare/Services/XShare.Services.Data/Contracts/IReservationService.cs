namespace XShare.Services.Data.Contracts
{
    using System;
    using System.Linq;
    using XShare.Data.Models;

    public interface IReservationService
    {
        IQueryable<Reservation> AllReservationss();

        Reservation CreateReservation(
            DateTime fromTime,
            DateTime toTime,
            string fromLocation,
            string toLocation,
            int carId,
            string userId);

        Reservation GetById(int id);
    }
}