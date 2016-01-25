namespace XShare.WebForms.Accident
{
    using System;
    using System.Linq;
    using System.Web.ModelBinding;
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

        protected void ShowGridWithAccidents(object sender, EventArgs e)
        {
            if (this.ViewAllAccidentsList.Visible)
            {
                this.ViewAllAccidentsList.Visible = false;
                this.InvokeAccidentsList.Text = "Show Accidents";

            }
            else
            {
                this.ViewAllAccidentsList.Visible = true;
                this.InvokeAccidentsList.Text = "Hide Accidents";
            }
        }

        protected void BackHomeClik(object sender, EventArgs e)
        {
            Response.Redirect("~/");
        }

        public XShare.Data.Models.Accident ViewAccidentDetails_GetItem([QueryString("id")]int? accidentId)
        {
            if (accidentId == null)
            {
                Response.Redirect("~/");
            }

            var accidentIdToDisplay = this.AccidentService.AccidentById((int)accidentId);
            return accidentIdToDisplay;
        }

        public IQueryable<XShare.Data.Models.Accident> GridViewAll_GetAccidents()
        {
            var accidentsToDisplay = this.AccidentService.AllAccident();
            return accidentsToDisplay;
        }
    }
}