namespace XShare.WebForms.Cars
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Ninject;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class All : System.Web.UI.Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IQueryable<Car> GridViewAll_GetData()
        {
            var cars = CarService.AllCars();
            return cars;
        }
    }
}