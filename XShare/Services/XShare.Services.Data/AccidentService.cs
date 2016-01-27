namespace XShare.Services.Data
{
    using System;
    using System.Linq;
    using XShare.Data.Models;
    using XShare.Data.Repositories;
    using XShare.Services.Data.Contracts;

    public class AccidentService : IAccidentService
    {
        private readonly IRepository<Accident> accidents;

        public AccidentService(IRepository<Accident> accidents)
        {
            this.accidents = accidents;
        }

        public Accident AccidentById(int id)
        {
            object serachId = id;
            return this.accidents.GetById(id);
        }

        public void DeleteById(int id)
        {
            Accident itemToDelet = this.accidents.GetById(id);

            if (itemToDelet != null)
            {
                this.accidents.Delete(itemToDelet);

                this.accidents.SaveChanges();
            }
        }

        public Accident GetById(int id)
        {
            return this.accidents.GetById(id);
        }

        public void UpadteAccident(Accident accidentToUpdate)
        {
            this.accidents.Update(accidentToUpdate);

            this.accidents.SaveChanges();
        }

        public IQueryable<Accident> GetFiltered(int? id,string userName, string model, string carType, string location, string descriptipn)
        {
            var accidentsQuery = this.accidents.All();

            if (id != null && id > 0)
            {
                accidentsQuery = accidentsQuery.Where(a => a.Id == id);
            }

            if (!string.IsNullOrEmpty(userName))
            {
                accidentsQuery = accidentsQuery.Where(a => a.User.UserName.Contains(userName));
            }

            if (!string.IsNullOrEmpty(model))
            {
                accidentsQuery = accidentsQuery.Where(a => a.Car.Description.Contains(model));
            }

            if (!string.IsNullOrEmpty(carType))
            {
                accidentsQuery = accidentsQuery.Where(a => a.Car.CarType.ToString() == carType);
            }

            if (!string.IsNullOrEmpty(location))
            {
                accidentsQuery = accidentsQuery.Where(a => a.Location.Contains(location));
            }

            if (!string.IsNullOrEmpty(descriptipn))
            {
                accidentsQuery = accidentsQuery.Where(a => a.Description.Contains(descriptipn));
            }

            return accidentsQuery;
        }

        public IQueryable<Accident> AllAccident()
        {
            return this.accidents.All();
        }

        public Accident CreateAccident(string location, string picture, string description, int carId, string userId)
        {
            var accidentToAdd = new Accident
            {
                Location = location,
                Picture = picture,
                Date = DateTime.UtcNow,
                Description = description,
                CarId = carId,
                UserId = userId
            };

            this.accidents.Add(accidentToAdd);
            this.accidents.SaveChanges();

            return accidentToAdd;
        }
    }
}
