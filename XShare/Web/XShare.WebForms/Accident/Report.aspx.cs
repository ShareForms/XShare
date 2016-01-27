namespace XShare.WebForms.Accident
{
    using System;
    using System.IO;
    using Ninject;
    using XShare.Data.Models;
    using XShare.Services.Data.Contracts;
    using XShare.WebForms.Controls.Notificator;

    public partial class Report : System.Web.UI.Page
    {
        [Inject]
        public IAccidentService AccidentService { get; set; }

        [Inject]
        public IUserService UserService { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Btn_Report(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string adressToAdd = string.Empty;
                var descriptionToAdd = this.Description.Text;
                var locationToAdd = this.Location.Text ?? string.Empty;
                string userName = string.Empty;
                var success = false;
                Accident addenAccident = null;

                if (Image.HasFile)
                {
                    try
                    {
                        if (Image.PostedFile.ContentType == "image/jpeg" ||
                            Image.PostedFile.ContentType == "image/png")
                        {
                            if (Image.PostedFile.ContentLength < 1048576)
                            {
                                userName = this.User.Identity.Name;
                                string filename = userName + Path.GetFileName(Image.FileName);
                                Image.SaveAs(Server.MapPath("~/Uploaded_Files/") + filename);
                                adressToAdd = "~/Uploaded_Files/" + filename;


                                var userId = this.UserService.GetUserId(userName);
                                var carId = this.UserService.GetLastCarId(userName);

                                 addenAccident = this.AccidentService.CreateAccident(locationToAdd, adressToAdd,
                                    descriptionToAdd, carId, userId);

                                Notificator.AddSuccessMessage(
                                    $"Success you have reported new accident, we are waiting for the next one as soon as possible!");
                                Notificator.ShowAfterRedirect = true;

                                success = true;
                            }
                            else
                            {
                                Notificator.AddErrorMessage("Upload status: The file has to be less than 1 MB!");
                            }
                        }
                        else
                        {
                            Notificator.AddErrorMessage("Upload status: Only JPEG and PNG files are accepted!");
                        }
                    }
                    catch (Exception ex)
                    {
                        Notificator.AddErrorMessage("Upload status: The file could not be uploaded. The following error occured: " + ex.Message);
                    }

                    if(success)
                    {
                        this.Response.Redirect("~/Accident/Details.aspx?id=" + addenAccident.Id);
                    }

                }
            }
        }
    }
}