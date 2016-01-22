using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ninject;
using XShare.Services.Data.Contracts;

namespace XShare.WebForms.Cars
{
    public partial class All : System.Web.UI.Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var cars = CarService.AllCars();
            this.test.Text = cars.ToString();
        }
    }
}