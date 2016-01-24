namespace XShare.Services.Data.Contracts
{
    using System.Linq;
    using XShare.Data.Models;

    public interface IFeaturesService
    {
        IQueryable<Feature> AllFeatures();

        Feature GetById(int id);
    }
}