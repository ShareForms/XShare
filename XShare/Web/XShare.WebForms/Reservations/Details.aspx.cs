using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XShare.WebForms.Reservations
{
    using System.Web.ModelBinding;
    using Ninject;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;

    public partial class Details : System.Web.UI.Page
    {
        [Inject]
        public IReservationService ReservationService { get; set; }

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

        public Reservation ViewReservationDetails_GetItem([QueryString("id")]int? reservationId)
        {
            if (reservationId == null)
            {
                Response.Redirect("~/");
            }

            var reservationToDislay = this.ReservationService.GetById((int)reservationId);
            return reservationToDislay;
        }
    }
}