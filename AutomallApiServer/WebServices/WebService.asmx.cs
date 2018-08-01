using System.Security;
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
        public string Hello(string userName, string password)
        {
            var accessDenied = !SecurityHelper.Authenticate(userName, password);
            if (accessDenied) throw new SecurityException();

            var userInRole1 = SecurityHelper.IsUserInRole(userName, SystemRoles.Role1);
            if (!userInRole1) throw new SecurityException();

            var user = SecurityHelper.GetUserByName(userName);
            
            return user.Name;
        }
    }
}
