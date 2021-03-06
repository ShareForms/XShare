﻿namespace XShare.Services.Data
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
        private readonly IRepository<Feature> features;

        public CarService(IRepository<Car> cars, IRepository<Rating> ratings, IRepository<Feature> features)
        {
            this.cars = cars;
            this.ratings = ratings;
            this.features = features;
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

        public int CarCount()
        {
            return this.cars.All().Count();
        }

        public Car CreateCar(string carDescription, double carFuelEconomy, string carPictureUrl, ICollection<int> carFeaturesIds, CarTypes carCarType)
        {
            var carToAdd = new Car
            {
                Description = carDescription,
                FuelEconomy = carFuelEconomy,
                PictureUrl = carPictureUrl,
                CarType = carCarType
            };

            //this.cars.Add(carToAdd);
            //this.cars.SaveChanges();

            foreach (var featureId in carFeaturesIds)
            {
                var feature = this.features.GetById(featureId);
                feature.Cars.Add(carToAdd);
            }

            this.features.SaveChanges();

            return carToAdd;
        }

        public IQueryable<Car> GetFreeCarsForTimeInterval(DateTime from, DateTime to)
        {
            return this.cars.All()
                .Where(c => c.Reservations.All(r => ((from < r.FromTime && to < r.ToTime)
                                                        || (from > r.ToTime && to > r.ToTime))));
        }

        public IQueryable<Car> GetFiltered(string model, string type, int? fuelEconomy)
        {
            var carsQuery = this.cars.All();

            if (!string.IsNullOrEmpty(model))
            {
                carsQuery = carsQuery.Where(c => c.Description.Contains(model));
            }

            if (fuelEconomy != null && fuelEconomy > 0)
            {
                carsQuery = carsQuery.Where(c => ((fuelEconomy - 1) <= c.FuelEconomy) && (c.FuelEconomy <= fuelEconomy + 1));
            }

            if (!string.IsNullOrEmpty(type))
            {
                carsQuery = carsQuery.Where(c => c.CarType.ToString() == type);
            }

            return carsQuery;
        }

        public void UpdateCar(Car carToUpdate)
        {
            this.cars.Update(carToUpdate);

            this.cars.SaveChanges();
        }

        public void DeleteById(int id)
        {
            Car itemToDelet = this.cars.GetById(id);

            if (itemToDelet != null)
            {
                this.cars.Delete(itemToDelet);

                this.cars.SaveChanges();
            }
        }
    }
}
