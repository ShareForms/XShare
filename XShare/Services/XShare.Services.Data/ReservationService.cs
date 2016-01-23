namespace XShare.Services.Data
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using XShare.Data.Models;
    using XShare.Data.Repositories;
    using XShare.Services.Data.Contracts;

    public class ReservationService : IReservationService
    {
        private readonly IRepository<Reservation> reservations;

        public ReservationService(IRepository<Reservation> reservations)
        {
            this.reservations = reservations;
        }

        public IQueryable<Reservation> AllReservationss()
        {
            var query = this.reservations.All();

            return query;
        }

        public Reservation CreateReservation(
            DateTime fromTime,
            DateTime toTime,
            string fromLocation,
            string toLocation,
            int carId,
            string userId)
        {
            var reservationToAdd = new Reservation
            {
                FromTime = fromTime,
                ToTime = toTime,
                From = fromLocation,
                To = toLocation,
                CarId = carId,
                UserId = userId
            };

            this.reservations.Add(reservationToAdd);
            this.reservations.SaveChanges();

            return reservationToAdd;
        }

        public Reservation GetById(int id)
        {
            return this.reservations.GetById(id);
        }
    }
}
