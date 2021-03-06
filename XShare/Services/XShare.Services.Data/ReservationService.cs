﻿namespace XShare.Services.Data
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

        public int ReservationCount()
        {
            return this.reservations.All().Count();
        }

        public void DeleteById(int id)
        {
            Reservation itemToDelet = this.reservations.GetById(id);

            if (itemToDelet != null)
            {
                this.reservations.Delete(itemToDelet);

                this.reservations.SaveChanges();
            }
        }

        public void UpdateReservation(Reservation item)
        {
            this.reservations.Update(item);

            this.reservations.SaveChanges();
        }

        public IQueryable<Reservation> GetFiltered(string from, string to, string carModel, string userName)
        {
            var reservationsQuery = this.reservations.All();

            if (!string.IsNullOrEmpty(from))
            {
                reservationsQuery = reservationsQuery.Where(r => r.From.Contains(from));
            }

            if (!string.IsNullOrEmpty(to))
            {
                reservationsQuery = reservationsQuery.Where(r => r.To.Contains(to));
            }

            if (!string.IsNullOrEmpty(carModel))
            {
                reservationsQuery = reservationsQuery.Where(r => r.Car.Description.Contains(carModel));
            }

            if (!string.IsNullOrEmpty(userName))
            {
                reservationsQuery = reservationsQuery.Where(r => r.User.UserName.Contains(userName));
            }

            return reservationsQuery;
        }
    }
}
