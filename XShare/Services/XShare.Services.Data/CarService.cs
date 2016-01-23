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
        private readonly IRepository<Rating> ratings;

        public CarService(IRepository<Car> cars, IRepository<Rating> ratings)
        {
            this.cars = cars;
            this.ratings = ratings;
        }

        public void AddRating(int carId, int rating)
        {
            var ratingToAdd = new Rating
            {
                CarId = carId,
                Value = rating
            };

            this.ratings.Add(ratingToAdd);
            this.ratings.SaveChanges();
        }

        public IQueryable<Car> AllCars()
        {
            return this.cars.All();
        }

        public Car CarById(int id)
        {
            object serachId = id;
            return this.cars.GetById(id);
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
