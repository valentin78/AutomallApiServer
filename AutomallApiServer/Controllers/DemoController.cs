using System.Web.Http;
using AutomallApiServer.Core;
using AutomallApiServer.Models;
using Umbraco.Web.WebApi;

namespace AutomallApiServer.Controllers
{
    public class DemoController : UmbracoApiController
    {
        [HttpPost]
        public string Hello([FromBody]HelloModel model)
        {
            var user = SecurityHelper.Authorize(model.Token, new[] { SystemRoles.Role1 });
            return $"User {user.Name} say: {model.Say}";
        }
    }

    public class HelloModel
    {
        public AuthenticationToken Token { get; set; }
        public string Say { get; set; }
    }
}