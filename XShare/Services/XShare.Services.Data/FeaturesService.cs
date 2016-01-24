namespace XShare.Services.Data
{
    using System.Collections.Generic;
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

        public IEnumerable<Feature> AllFeatures()
        {
            return this.features.All().AsEnumerable();
        }

        public Feature GetById(int id)
        {
            return this.features.GetById(id);
        }
    }
}
