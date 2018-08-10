using System.Web.Http;
using System.Web.Http.Results;

using AutomallApiServer.Core;
using AutomallApiServer.Core.Contexts;
using AutomallApiServer.Models;
using AutomallApiServer.Models.Cube;
using Umbraco.Web.WebApi;

namespace AutomallApiServer.Controllers
{
    public class OkitokiController : UmbracoApiController
    {
        [HttpGet]
        public JsonResult<ps_GetRingGroupByCallerIDResult> RingGroup(string userName, string password, string say)
        {
            var model = new GetRingGroupParamsModel
            {
                UserName = userName,
                Password = password,
                Say = say
            };
            var user = SecurityHelper.Authorize(model, new[] { SystemRoles.OkiToki });

            using (var ctx = new CubeContext())
            {
                var r = ctx.GetRingGroupByCallerId(user.Name);
                return Json(r);
                //return r.RingGroup;
            }
        }
    }

    public class GetRingGroupParamsModel : AuthenticationToken
    {
        public string Say { get; set; }
    }
}