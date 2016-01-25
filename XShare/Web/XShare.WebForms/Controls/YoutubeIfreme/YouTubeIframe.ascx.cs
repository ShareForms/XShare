namespace XShare.WebForms.Controls.YoutubeIfreme
{
    using System;
    using System.Web.UI;

    public partial class YouTubeIframe : UserControl
    {
        public enum VideoQuality
        {
            Small,
            Medium,
            Large,
            Hd720,
            Hd1080,
            Highres,
            Default
        }

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

        public string VQuality
        {
            get; set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(
                this.Page,
                typeof(System.Web.UI.Page),
                "javascript",
                $"loadIframe('{this.VideoId}', {this.Volume}, '{this.Loop.ToString().ToLower()}', '{this.VQuality.ToLower()}');", true);
        }
    }
}