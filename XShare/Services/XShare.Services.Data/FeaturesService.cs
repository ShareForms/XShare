namespace XShare.Services.Data
{
    using System.Linq;
    using XShare.Data.Models;
    using XShare.Data.Repositories;
    using XShare.Services.Data.Contracts;

    public class FeaturesService : IFeaturesService
    {
        private readonly IRepository<Feature> features;

        public FeaturesService(IRepository<Feature> features)
        {
            this.features = features;
        }

        public IQueryable<Feature> AllFeatures()
        {
            return this.features.All();
        }

        public Feature GetById(int id)
        {
            return this.features.GetById(id);
        }
    }
}
