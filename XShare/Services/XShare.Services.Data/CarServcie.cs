namespace XShare.Services.Data
{
    using System;
    using System.Linq;
    using XShare.Data.Models;
    using XShare.Data.Repositories;
    using XShare.Services.Data.Contracts;

    public class CarServcie : ICarService
    {
        private readonly IRepository<Car> cars;

        public CarServcie(IRepository<Car> cars)
        {
            this.cars = cars;
        }

        public IQueryable<Car> AllCars(string name)
        {
            return this.cars.All();
        }
    }
}
