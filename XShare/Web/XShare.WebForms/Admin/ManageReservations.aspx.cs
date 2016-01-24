namespace XShare.WebForms.Admin
{
    using System;
    using System.Linq;
    using System.Web.UI;
    using Ninject;
    using XShare.Common.Extensions;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class ManageReservations : Page
    {
        [Inject]
        public IReservationService ReservationService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public void ListViewReservations_DeleteItem(int Id)
        {
            this.ReservationService.DeleteById(Id);
        }

        public void ListViewReservations_UpdateItem(int Id)
        {
            var item = this.ReservationService.GetById(Id);

            if (item == null)
            {
                this.ModelState.AddModelError("", $"Item with id {this.ID} was not found");
                return;
            }

            this.TryUpdateModel(item);
            if (this.ModelState.IsValid)
            {
                this.ReservationService.UpdateReservation(item);
            }
        }

        public IQueryable<Reservation> GridViewAll_GetData(string sortByExpression)
        {
            var reservationsQuery = this.ReservationService.AllReservationss();

            if (sortByExpression != null)
            {
                if (sortByExpression.EndsWith(" DESC"))
                {
                    reservationsQuery = reservationsQuery
                        .OrderByDescending(sortByExpression.Substring(0, sortByExpression.Length - 5));
                }
                else
                {
                    reservationsQuery = reservationsQuery
                        .OrderBy(sortByExpression);
                }
            }

            return reservationsQuery;
        }
    }
}