namespace XShare.WebForms.Controls.Confirmator
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;



    public partial class Confirmator : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.IncludeTheCssAndJavaScript();
        }


        private void IncludeTheCssAndJavaScript()
        {
            ClientScriptManager cs = Page.ClientScript;

            string notifierScriptURL = this.TemplateSourceDirectory +
                "/Scripts/Confirmator.js";

            if (!cs.IsClientScriptIncludeRegistered(notifierScriptURL))
            {
                StringBuilder script = new StringBuilder();
                script.Append($"<script src=\"{notifierScriptURL}\"></script>");
                cs.RegisterStartupScript(this.GetType(), notifierScriptURL, script.ToString());
            }


            // Include the ErrorSuccessNotifier.css stylesheet (if not already included)
            string cssRelativeURL = this.TemplateSourceDirectory +
                "/Styles/Confirmator.css";
            if (!cs.IsClientScriptBlockRegistered(cssRelativeURL))
            {
                string cssLinkCode = string.Format(
                    @"<link href='{0}' rel='stylesheet' type='text/css' />",
                    cssRelativeURL);
                cs.RegisterClientScriptBlock(this.GetType(), cssRelativeURL, cssLinkCode);
            }
        }
    }
}