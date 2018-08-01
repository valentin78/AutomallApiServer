using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using AutomallApiServer.Models;
using Umbraco.Core;
using Umbraco.Core.Models;
using Umbraco.Web.Security;

namespace AutomallApiServer.Core
{
    public class SecurityHelper
    {
        public static bool Authenticate(string userName, string password) {
            var memberShipHelper = new MembershipHelper(Umbraco.Web.UmbracoContext.Current);
            return memberShipHelper.Login(userName, password);
        }

        public static bool IsUserInRole(string userName, SystemRoles role)
        {
            return GetUserRolesByName(userName).Any(r => r == role.ToString("F"));
        }

        public static List<string> GetUserRolesByName(string userName)
        {
            return Roles.GetRolesForUser(userName).ToList();
        }

        public static IMember GetUserByName(string userName)
        {
            var memberService = ApplicationContext.Current.Services.MemberService;
            return memberService.GetByUsername(userName);
        }
    }
}