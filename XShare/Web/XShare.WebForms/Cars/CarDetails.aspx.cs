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
    }
}