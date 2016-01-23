namespace XShare.WebForms.Accident
{
    using System;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Security.AccessControl;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using Ninject;
    using XShare.Services.Data.Contracts;

    public partial class Report : System.Web.UI.Page
    {
        [Inject]
        public IAccidentService AccidentService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Btn_Report(object sender, EventArgs e)
        {
            string adressToAdd = string.Empty;
            var descriptionToAdd = this.Description.Text;
            var locationToAdd = this.Location.Text ?? string.Empty;

            if (Image.HasFile)
            {
                try
                {
                    if (Image.PostedFile.ContentType == "image/jpeg" ||
                         Image.PostedFile.ContentType == "image/png" )
                    {
                        if (Image.PostedFile.ContentLength < 1048576)
                        {
                            string filename = Path.GetFileName(Image.FileName);
                            string userName = this.User.Identity.Name;

                            if (!Directory.Exists("Uploaded_Files/" + userName))
                            {
                                Directory.CreateDirectory("Uploaded_Files/" + userName);
                            }
                            Image.SaveAs(Server.MapPath("~/Uploaded_Files/") + userName + "/" + filename);
                            adressToAdd = "~/Uploaded_Files/" + userName + "/" + filename;
                        }
                        else
                            ErrorMessage.Text = "Upload status: The file has to be less than 1 MB!";
                    }
                    else
                        ErrorMessage.Text = "Upload status: Only JPEG and PNG files are accepted!";
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }

            if (this.User != null && this.User.Identity.IsAuthenticated)
            {
                var userName = HttpContext.Current.User.Identity.Name;
            }

            // this.AccidentService.CreateAccident(locationToAdd, adressToAdd, descriptionToAdd, 1, "pesho");           
        }
    }
}