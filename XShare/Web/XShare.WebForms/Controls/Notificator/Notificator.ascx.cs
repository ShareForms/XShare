namespace XShare.WebForms.Controls.Notificator
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.HtmlControls;
    using System.Web.UI.WebControls;

    public enum MessageType
    {
        Success,
        Info,
        Warning,
        Danger
    }

    public class NotificationMessage
    {
        public string Text { get; set; }
        public MessageType Type { get; set; }
        public bool AutoHide { get; set; }
    }

    public partial class Notificator : System.Web.UI.UserControl
    {
        private const string KEY_NOTIFICATION_MESSAGES = "NotificationMessages";
        private const string KEY_SHOW_AFTER_REDIRECT = "NotificationMessagesShowAfterRedirect";

        public static void AddMessage(NotificationMessage msg)
        {
            List<NotificationMessage> messages = NotificationMessages;
            if (messages == null)
            {
                messages = new List<NotificationMessage>();
            }

            messages.Add(msg);
            HttpContext.Current.Session[KEY_NOTIFICATION_MESSAGES] = messages;
        }

        public static bool ShowAfterRedirect
        {
            get
            {
                object showAfterRedirect = null;
                if (HttpContext.Current.Session != null)
                {
                    showAfterRedirect =
                   HttpContext.Current.Session[KEY_SHOW_AFTER_REDIRECT];
                }

                return (showAfterRedirect != null);
            }
            set
            {
                if (value)
                {
                    if (HttpContext.Current.Session != null)
                    {
                        HttpContext.Current.Session[KEY_SHOW_AFTER_REDIRECT] = true;
                    }
                }
                else
                {
                    if (HttpContext.Current.Session != null)
                    {
                        HttpContext.Current.Session.Remove(KEY_SHOW_AFTER_REDIRECT);
                    }
                }
            }
        }

        private static void ClearMessages()
        {
            if (HttpContext.Current.Session != null)
            {
                HttpContext.Current.Session[KEY_NOTIFICATION_MESSAGES] = null;
            }
        }

        private static List<NotificationMessage> NotificationMessages
        {
            get
            {
                List<NotificationMessage> messages = new List<NotificationMessage>();

                if (HttpContext.Current.Session != null && HttpContext.Current.Session[KEY_NOTIFICATION_MESSAGES] != null)
                {
                    messages = (List<NotificationMessage>)
                    HttpContext.Current.Session[KEY_NOTIFICATION_MESSAGES];
                }

                return messages;
            }
        }

        public static void AddInfoMessage(string msg)
        {
            AddMessage(new NotificationMessage()
            {
                Text = msg,
                Type = MessageType.Info,
                AutoHide = true
            });
        }

        public static void AddSuccessMessage(string msg)
        {
            AddMessage(new NotificationMessage()
            {
                Text = msg,
                Type = MessageType.Success,
                AutoHide = true
            });
        }

        public static void AddWarningMessage(string msg)
        {
            AddMessage(new NotificationMessage()
            {
                Text = msg,
                Type = MessageType.Warning,
                AutoHide = false
            });
        }

        public static void AddErrorMessage(string msg)
        {
            AddMessage(new NotificationMessage()
            {
                Text = msg,
                Type = MessageType.Danger,
                AutoHide = false
            });
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowWaitingNotificationMessages();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!ShowAfterRedirect)
            {
                ShowWaitingNotificationMessages();
            }
        }

        private void ShowWaitingNotificationMessages()
        {
            if (NotificationMessages != null)
            {
                int index = 1;
                foreach (var msg in NotificationMessages)
                {
                    Panel msgPanel = new Panel();
                    msgPanel.CssClass =
                        "notificator flyover flyover-centered alert alert-" + msg.Type.ToString().ToLower()
                        + " position-top-" + (index * 10).ToString();
                    if (msg.AutoHide)
                    {
                        msgPanel.CssClass += " AutoHide";
                    }

                    msgPanel.ID = msg.Type + "Msg" + index;

                    HtmlGenericControl dismissBtn = new HtmlGenericControl();
                    dismissBtn.Attributes["data-dismiss"] = "alert";
                    dismissBtn.Attributes["class"] = "close";
                    dismissBtn.Attributes["type"] = "button";
                    dismissBtn.TagName = "button";
                    dismissBtn.InnerHtml = "×";

                    HtmlGenericControl title = new HtmlGenericControl();
                    title.TagName = "h4";
                    title.InnerText = msg.Type.ToString();

                    HtmlGenericControl paragraph = new HtmlGenericControl();
                    paragraph.TagName = "p";
                    paragraph.InnerText = msg.Text;

                    msgPanel.Controls.Add(title);
                    msgPanel.Controls.Add(dismissBtn);
                    msgPanel.Controls.Add(title);
                    msgPanel.Controls.Add(paragraph);

                    this.Controls.Add(msgPanel);
                    index++;
                }

                ClearMessages();

                IncludeTheCssAndJavaScript();
            }

            ShowAfterRedirect = false;
        }

        private void IncludeTheCssAndJavaScript()
        {
            ClientScriptManager cs = Page.ClientScript;

            string notifierScriptURL = this.TemplateSourceDirectory +
                "/Scripts/Notificator.js";

            if (!cs.IsClientScriptIncludeRegistered(notifierScriptURL))
            {
                StringBuilder script = new StringBuilder();
                script.Append($"<script src=\"{notifierScriptURL}\"></script>");
                cs.RegisterStartupScript(this.GetType(), notifierScriptURL, script.ToString());
            }


            // Include the ErrorSuccessNotifier.css stylesheet (if not already included)
            string cssRelativeURL = this.TemplateSourceDirectory +
                "/Styles/Notificator.css";
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