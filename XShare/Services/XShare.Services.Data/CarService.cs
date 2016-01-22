namespace XShare.Services.Data
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using XShare.Data.Models;
    using XShare.Data.Repositories;
    using XShare.Services.Data.Contracts;

    public class CarService : ICarService
    {
        private readonly IRepository<Car> cars;

        public CarService(IRepository<Car> cars)
        {
            this.cars = cars;
        }

        public IQueryable<Car> AllCars()
        {
            return this.cars.All();
        }

        public Car CreateCar(string carDescription, double carFuelEconomy, string carPictureUrl, List<string> carFeatures, CarTypes carCarType)
        {
            var carToAdd = new Car
            {
                Description = carDescription,
                FuelEconomy = carFuelEconomy,
                PictureUrl = carPictureUrl,
                Features = carFeatures,
                CarType = carCarType
            };

            this.cars.Add(carToAdd);
            this.cars.SaveChanges();

            return carToAdd;
        }
    }
}
