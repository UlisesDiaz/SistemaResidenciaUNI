using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SistemaResidenciaUNI.Startup))]
namespace SistemaResidenciaUNI
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
