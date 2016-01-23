namespace XShare.Services.Data.Contracts
{
    using System.Collections.Generic;
    using System.Linq;
    using XShare.Data.Models;

    public interface ICarService
    {
        IQueryable<Car> AllCars();

        Car CarById(int id);

        Car CreateCar(string carDescription, double carFuelEconomy, string carPictureUrl, List<string> carFeatures, CarTypes carCarType);

        void AddRating(int carId, int rating);
    }
}
