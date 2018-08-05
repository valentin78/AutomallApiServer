using Our.Umbraco.AuthU;
using Our.Umbraco.AuthU.Services;
using Umbraco.Core;

namespace AutomallApiServer.Core
{
    public class Bootstrap: ApplicationEventHandler
    {
        protected override void ApplicationStarted(UmbracoApplicationBase app, ApplicationContext ctx)
        {
            // config doc: https://github.com/mattbrailsford/umbraco-authu
            OAuth.ConfigureEndpoint("/oauth/token", new OAuthOptions
            {
                UserService = new UmbracoMembersOAuthUserService(),
                SymmetricKey = "856FECBA3B06519C8DDDBC80BB080553",
                AccessTokenLifeTime = 20, // Minutes
                AllowInsecureHttp = true // During development only
            });
        }
    }
}