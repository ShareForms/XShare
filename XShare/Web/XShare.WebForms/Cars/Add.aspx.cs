
namespace XShare.WebForms.Cars
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Data.Models;
    using Ninject;
    using XShare.Services.Data.Contracts;
    using XShare.WebForms.Controls.Notificator;

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
            if (Page.IsValid)
            {
                var carDescription = this.Description.Text;
                var carFuelEconomy = double.Parse(this.FuelEconomy.Text);
                var carPictureUrl = this.PictureUrl.Text;

                var carFeatures = new HashSet<int>();

                CarTypes carCarType = (CarTypes)Enum.Parse(typeof(CarTypes), this.CarType.SelectedValue);


                foreach (ListItem item in this.Features.Items)
                {
                    var fetureId = int.Parse(item.Value);
                    carFeatures.Add(fetureId);
                }

                this.CarService.CreateCar(carDescription, carFuelEconomy, carPictureUrl, carFeatures, carCarType);

                Notificator.AddSuccessMessage($"Car '{carDescription}' added");
                Notificator.ShowAfterRedirect = true;

                this.Response.Redirect("~/Cars/All");
            }
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

        protected void SetDataParams(object sender, EventArgs e)
        {
            Page.Validate();

            if (this.readytoave.Checked && Page.IsValid)
            {
                this.BtnAddCar.Enabled = true;
            }
            else if (this.readytoave.Checked && !Page.IsValid)
            {
                Notificator.AddWarningMessage("All fields are required");
                this.BtnAddCar.Enabled = false;
            }
            else
            {
                this.BtnAddCar.Enabled = false;
            }
            var placeholder = $"{this.Description.Text},{this.FuelEconomy.Text}, {this.PictureUrl.Text}, {this.CarType.SelectedItem.Text}";

            this.BtnAddCar.Attributes.Add("data-placeholder", placeholder);
        }
    }
}