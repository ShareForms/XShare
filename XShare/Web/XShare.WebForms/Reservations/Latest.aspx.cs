using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XShare.WebForms.Reservations
{
    using Ninject;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class Latest : System.Web.UI.Page
    {
        [Inject]
        public IReservationService ReservationService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public IQueryable<Reservation> GridViewAll_GetData()
        {
            var reservations = this.ReservationService.AllReservationss();
            return reservations;
        }
    }
}