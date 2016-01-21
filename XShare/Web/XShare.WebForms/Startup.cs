using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(XShare.WebForms.Startup))]
namespace XShare.WebForms
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
