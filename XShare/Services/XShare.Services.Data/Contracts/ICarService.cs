namespace XShare.Services.Data.Contracts
{
    using System.Linq;
    using XShare.Data.Models;

    public interface ICarService
    {
        IQueryable<Car> AllCars(string name);
    }
}
