namespace XShare.WebForms.Accident
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.ModelBinding;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Ninject;
    using Services.Data.Contracts;

    public partial class Details : System.Web.UI.Page
    {
        [Inject]
        public IAccidentService AccidentService { get; set; }

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

        public Accident ViewAccidentDetails_GetItem([QueryString("id")]int? accidentId)
        {
            if (accidentId == null)
            {
                Response.Redirect("~/");
            }

            var accidentIdToDisplay = this.AccidentService.AccidentById((int)accidentId);
            return accidentIdToDisplay;
        }
    }
}