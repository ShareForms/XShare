namespace XShare.WebForms.Reservations
{
    using System;
    using System.Linq;
    using Ninject;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class Make : System.Web.UI.Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CheckAvailableCars_Click(object sender, EventArgs e)
        {
            this.ViewAvailableCars.Visible = true;
            this.ViewAvailableCars.Enabled = true;
            this.ViewAvailableCars.DataBind();
        }

        public IQueryable<Car> GridViewAll_GetData()
        {
            var cars = this.CarService
                .GetFreeCarsForTimeInterval(
                    DateTime.Parse(this.FromTime.Text),
                    DateTime.Parse(this.ToTime.Text));
            return cars;
        }
    }
}