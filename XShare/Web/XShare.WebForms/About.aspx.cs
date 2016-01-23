namespace XShare.WebForms
{
    using System;
    using System.Web.UI;
    using Ninject;
    using XShare.Services.Data.Contracts;

    public partial class About : Page
    {
        [Inject]
        public ICarService CarService { get; set; }

        [Inject]
        public IUserService UserService { get; set; }

        [Inject]
        public IReservationService ReservationService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var usersCount = this.UserService.UserCount();
            var carsCount = this.CarService.CarCount();
            var resevationCount = this.ReservationService.ReservationCount();

            this.UsersCount.Text = usersCount.ToString();
            this.CarsCount.Text = carsCount.ToString();
            this.ReservationsCount.Text = resevationCount.ToString();
        }
    }
}