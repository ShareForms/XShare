namespace XShare.WebForms.Accident
{
    using System;
    using System.IO;
    using Ninject;
    using XShare.Services.Data.Contracts;

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
            string adressToAdd = string.Empty;
            var descriptionToAdd = this.Description.Text;
            var locationToAdd = this.Location.Text ?? string.Empty;
            string userName = string.Empty;

            if (Image.HasFile)
            {
                try
                {
                    if (Image.PostedFile.ContentType == "image/jpeg" ||
                         Image.PostedFile.ContentType == "image/png" )
                    {
                        if (Image.PostedFile.ContentLength < 1048576)
                        {                            
                            userName = this.User.Identity.Name;
                            string filename = userName + Path.GetFileName(Image.FileName);
                            Image.SaveAs(Server.MapPath("~/Uploaded_Files/") + filename);
                            adressToAdd = "~/Uploaded_Files/" + filename;
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

            var userId = this.UserService.GetUserId(userName);
            var carId = this.UserService.GetLastCarId(userName);

            this.AccidentService.CreateAccident(locationToAdd, adressToAdd, descriptionToAdd, carId, userId);

            this.Response.Redirect("~/");
        }
    }
}