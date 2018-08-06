using System.Web.Http;
using AutomallApiServer.Core;
using AutomallApiServer.Models;
using Umbraco.Web.WebApi;

namespace AutomallApiServer.Controllers
{
    public class OkitokiController : UmbracoApiController
    {
        [HttpGet]
        public string RingGroup(GetRingGroupParamsModel model)
        {
            var user = SecurityHelper.Authorize(model, new[] { SystemRoles.Role1 });
            return $"User {user.Name} say: {model.Say}";
        }

        [HttpPost]
        public string Hello([FromBody]HelloModel model)
        {
            var user = SecurityHelper.Authorize(model.Token, new[] { SystemRoles.Role1 });
            return $"User {user.Name} say: {model.Say}";
        }
    }

    public class GetRingGroupParamsModel : AuthenticationToken
    {
        public string Say { get; set; }
    }
}