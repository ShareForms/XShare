namespace XShare.WebForms.Controls.YoutubeIfreme
{
    using System;
    using System.Web.UI;

    public partial class YouTubeIframe : UserControl
    {
        public string VideoId
        {
            get; set;
        }

        public int Volume
        {
            get; set;
        }

        public bool Loop
        {
            get; set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(
                this.Page,
                typeof(System.Web.UI.Page),
                "javascript",
                $"loadIframe('{this.VideoId.ToString()}', {this.Volume}, '{this.Loop.ToString().ToLower()}');", true);
        }
    }
}