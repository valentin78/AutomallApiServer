using System.Web.Services;
using AutomallApiServer.Core;
using AutomallApiServer.Models;

namespace AutomallApiServer.WebServices
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class WebService : System.Web.Services.WebService
    {
        [WebMethod]
        public string Hello(AuthenticationToken token)
        {
            var user = SecurityHelper.Authorize(token, new [] { SystemRoles.Role1 });
            return user.Name;
        }
    }
}
