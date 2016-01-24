namespace XShare.Services.Data
{
    using System;
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
