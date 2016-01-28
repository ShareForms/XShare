namespace XShare.WebForms.Cars
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.ModelBinding;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Data.Models;
    using Ninject;
    using Services.Data.Contracts;

    public partial class CarDetails : System.Web.UI.Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (!this.User.Identity.IsAuthenticated)
            {
                this.Response.Redirect("~/Account/Login");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public Car ViewCarDetails_GetItem([QueryString("id")]int? carID)
        {
            if (carID == null)
            {
                Response.Redirect("~/");
            }

            var carToDisplay = this.CarService.CarById((int)carID);
            return carToDisplay;
        }

        public IQueryable<int> GetCarRatings()
        {
            return (new[] { 1, 2, 3, 4, 5 }).AsQueryable();
        }

        protected void Btn_RateCar(object sender, EventArgs e)
        {
            var carRating = int.Parse(this.CarRateDropDown.SelectedValue);
            var carId = int.Parse(this.Request.QueryString["id"]);

            this.CarService.AddRating(carId, carRating);

            this.Response.Redirect(Request.RawUrl);
        }
    }
}