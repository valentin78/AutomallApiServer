using System;
using System.Web.Http;
using System.Web.Http.Results;

using AutomallApiServer.Core;
using AutomallApiServer.Core.Contexts;
using AutomallApiServer.Models;
using AutomallApiServer.Models.Cube;
using log4net;
using Newtonsoft.Json;
using Umbraco.Web.WebApi;

namespace AutomallApiServer.Controllers
{
    public class OkitokiController : UmbracoApiController
    {
        private static readonly ILog Log = LogManager.GetLogger("ApiLog");

        [HttpGet]
        public JsonResult<ps_GetRingGroupByCallerIDResult> RingGroup(string userName, string password, string say)
        {
            var start = DateTime.Now;
            var model = new GetRingGroupParamsModel
            {
                UserName = userName,
                Password = password,
                Say = say
            };
            SecurityHelper.Authorize(model, new[] { SystemRoles.OkiToki });

            using (var ctx = new CubeContext())
            {
                var r = ctx.GetRingGroupByCallerId(say);
                Log.Debug($"RingGroup for {say} - {(DateTime.Now - start).Milliseconds} ms: {JsonConvert.SerializeObject(r)}");

                return Json(r);
            }
        }
    }

    public class GetRingGroupParamsModel : AuthenticationToken
    {
        public string Say { get; set; }
    }
}