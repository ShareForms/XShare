namespace XShare.Services.Data
{
    using System;
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
            var RESULT = this.reservations.All();

           // var HUC = RESULT.ToList();

            return RESULT;
        }

        public int ReservationCount()
        {
            return this.reservations.All().Count();
        }
    }
}
