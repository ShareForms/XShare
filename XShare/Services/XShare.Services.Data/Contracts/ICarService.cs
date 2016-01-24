namespace XShare.Services.Data.Contracts
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using XShare.Data.Models;

    public interface ICarService
    {
        IQueryable<Car> AllCars();

        Car CarById(int id);

        Car CreateCar(string carDescription, double carFuelEconomy, string carPictureUrl, ICollection<int> carFeaturesIds, CarTypes carCarType);


        IQueryable<Car> GetFreeCarsForTimeInterval(DateTime from, DateTime to);

        void AddRating(int carId, int rating);

        int CarCount();
    }
}
