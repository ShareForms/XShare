namespace XShare.WebForms.Reservations
{
    using System;
    using System.Linq;
    using Ninject;
    using XShare.Common.Extensions;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class Latest : System.Web.UI.Page
    {
        [Inject]
        public IReservationService ReservationService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
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