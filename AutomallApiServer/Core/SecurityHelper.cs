using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Web.Security;
using AutomallApiServer.Models;
using Umbraco.Core;
using Umbraco.Core.Models;
using Umbraco.Web.Security;

namespace AutomallApiServer.Core
{
    public class SecurityHelper
    {
        public static IMember Authorize(AuthenticationToken token, SystemRoles[] allowedRoles)
        {
            if (!Authenticate(token)) throw new SecurityException();
            if (!allowedRoles.Any(role => IsUserInRole(token.UserName, role))) throw new SecurityException();
            return GetUserByName(token.UserName);
        }

        public static bool Authenticate(AuthenticationToken token) {
            var memberShipHelper = new MembershipHelper(Umbraco.Web.UmbracoContext.Current);
            return memberShipHelper.Login(token.UserName, token.Password);
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