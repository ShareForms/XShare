using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace XShare.WebForms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.myIframe.Src = "https://www.youtube.com/embed/r8BOh82Pwvo?autoplay=1&amp;loop=1&amp;rel=0&amp;controls=0&amp;showinfo=0";
        }
    }
}