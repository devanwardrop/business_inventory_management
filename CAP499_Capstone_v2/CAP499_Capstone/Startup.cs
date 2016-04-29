using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CAP499_Capstone.Startup))]
namespace CAP499_Capstone
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
