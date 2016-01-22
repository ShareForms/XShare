namespace XShare.Services.Data.Contracts
{
    using System.Collections.Generic;
    using System.Linq;
    using XShare.Data.Models;

    public interface ICarService
    {
        IQueryable<Car> AllCars();

        Car CreateCar(string carDescription, double carFuelEconomy, string carPictureUrl, List<string> carFeatures, CarTypes carCarType);
    }
}
