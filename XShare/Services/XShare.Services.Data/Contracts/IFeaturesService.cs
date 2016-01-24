namespace XShare.Services.Data.Contracts
{
    using System.Collections.Generic;
    using System.Linq;
    using XShare.Data.Models;

    public interface IFeaturesService
    {
        IEnumerable<Feature> AllFeatures();

        Feature GetById(int id);
    }
}