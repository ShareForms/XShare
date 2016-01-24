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

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Btn_AddCar(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                var carDescription = this.Description.Text;
                var carFuelEconomy = double.Parse(this.FuelEconomy.Text);
                var carPictureUrl = this.PictureUrl.Text;

                CarTypes carCarType = (CarTypes)Enum.Parse(typeof(CarTypes), this.CarType.SelectedValue);

                var carFeatures = new List<Feature>();

                Feature a = new Feature { Description = "Air Condtion" };
                carFeatures.Add(a);

                this.CarService.CreateCar(carDescription, carFuelEconomy, carPictureUrl, carFeatures, carCarType);

                this.Response.Redirect("~/Cars/All");
            }
        }

        public IQueryable<string> GetFeatures()
        {
            return (new[] { "Automatic Transmition", "Cabrio", "Cruise control", "Navigation system", "Xenon headlights", "Ventilated Seats" }).AsQueryable();
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