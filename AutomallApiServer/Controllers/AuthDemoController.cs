using System.Web.Http;
using Our.Umbraco.AuthU.Web.WebApi;
using Umbraco.Web.WebApi;

namespace AutomallApiServer.Controllers
{
    [OAuth]
    public class AuthDemoController : UmbracoApiController
    {
        [HttpGet]
        [Authorize]
        public string Hello(string say)
        {
            var user = Members.GetCurrentMember()?.Name;
            return $"User {user} say: {say}";
        }
    }
}