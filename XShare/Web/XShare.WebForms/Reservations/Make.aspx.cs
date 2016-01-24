namespace XShare.WebForms.Reservations
{
    using System;
    using System.Linq;
    using System.Web.UI.WebControls;
    using Ninject;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class Make : System.Web.UI.Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        [Inject]
        public IUserService UsersService { get; set; }

        [Inject]
        public IReservationService ReservationService { get; set; }

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

        protected void Btn_Reservation_OnClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Button btn = (Button)sender;
                int carId = int.Parse(btn.CommandArgument);
                string userId = this.UsersService.GetUserId(this.User.Identity.Name);

                var newReservation = this.ReservationService.CreateReservation(
                    DateTime.Parse(this.FromTime.Text),
                    DateTime.Parse(this.ToTime.Text),
                    this.From.Text,
                    this.To.Text,
                    carId,
                    userId);

                var id = newReservation.Id;

                Response.Redirect("/Reservations/Details?id=" + id);
            }
        }
    }
}