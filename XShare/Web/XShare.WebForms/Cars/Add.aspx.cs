namespace XShare.WebForms.Cars
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Data.Models;
    using Ninject;
    using XShare.Services.Data.Contracts;

    public partial class Add : System.Web.UI.Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        [Inject]
        public IFeaturesService FeatureService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_AddCar(object sender, EventArgs e)
        {
            var carDescription = this.Description.Text;
            var carFuelEconomy = double.Parse(this.FuelEconomy.Text);
            var carPictureUrl = this.PictureUrl.Text;

            CarTypes carCarType = (CarTypes)Enum.Parse(typeof(CarTypes), this.CarType.SelectedValue);

            var carFeatures = new HashSet<int>();

            foreach (ListItem item in this.Features.Items)
            {
                if (item.Selected)
                {
                    var fetureId = int.Parse(item.Value);
                    carFeatures.Add(fetureId);
                }
            }

            this.CarService.CreateCar(carDescription, carFuelEconomy, carPictureUrl, carFeatures, carCarType);

            this.Response.Redirect("~/Cars/All");
        }

        public IEnumerable<Feature> GetFeatures()
        {
            return this.FeatureService.AllFeatures();
        }

        public IQueryable<string> GetCarType()
        {
            var carTypes = Enum.GetValues(typeof(CarTypes)).AsQueryable()
                .Cast<CarTypes>()
                .Select(x => x.ToString());
            return carTypes;
        }
    }
}