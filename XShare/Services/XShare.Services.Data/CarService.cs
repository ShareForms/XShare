namespace XShare.Services.Data
{
    using System;
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
    }
}
