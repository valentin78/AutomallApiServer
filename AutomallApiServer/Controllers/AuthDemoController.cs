using System.Web.Http;
using Our.Umbraco.AuthU.Web.WebApi;
using Umbraco.Web.WebApi;

namespace AutomallApiServer.Controllers
{
    [OAuth]
    public class AuthDemoController : UmbracoApiController
    {
        [HttpGet]
        [Route("Hello")]
        [Authorize(Roles = "Role1")]
        public string Hello(string say)
        {
            var user = Members.GetCurrentMember()?.Name;
            return $"User {user} say: {say}";
        }

        [HttpGet]
        [Route("Crap")]
        [Authorize(Roles = "Role2")]
        public string Crap()
        {
            return "no matter";
        }
    }
}