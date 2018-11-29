using System;
using System.Data.Entity.Core.Objects;
using System.Globalization;
using AutomallApiServer.Core;
using AutomallApiServer.Core.Contexts;
using AutomallApiServer.Models;
using AutomallApiServer.Models.Cube;
using AutomallApiServer.Models.Eurogarage;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Results;
using AutomallApiServer.Core.Contexts.AutomallModels;
using Umbraco.Core.Models.Membership;
using Umbraco.Web.WebApi;
using ValmiStore.Model.Cube.DataLayer;

namespace AutomallApiServer.Controllers
{
    public class EurogarageController : UmbracoApiController
    {
        [HttpGet]
        public JsonResult<ps_GetRingGroupByCallerIDResult> RingGroup(string userName, string password, string say)
        {
            var model = new AuthenticationToken
            {
                UserName = userName,
                Password = password
            };
            var user = SecurityHelper.Authorize(model, new[] { SystemRoles.OkiToki });

            using (var ctx = new CubeContext())
            {
                var r = ctx.GetRingGroupByCallerId(user.Name);
                return Json(r);
                //return r.RingGroup;
            }
        }

        [HttpGet]
        [BasicAuthentication(new[] { SystemRoles.Eurogarage })]
        public string Test()
        {
            return "OK";
        }

        [HttpGet]
        [HttpPost]
        [BasicAuthentication]
        public ResponseMessageResult Nomenclature(int kagId, string number)
        {
            using (var ctx = new CubeContext())
            {
                var r = ctx.vsspGetWaresList(null, null, null, null, kagId, null, null, null, null, null, null, true,
                    number, null, null, null, null, null, null,
                    out _, out _, out _, out _);
                var result = r.Select(i => new NomenclatureElement
                {
                    Brand = i.ProducerName,
                    WareName = i.WareName,
                    WareId = i.WareId,
                    UnitName = i.UnitShName,
                    WareNum = i.WareNum,
                    Price = i.PriceOut ?? 0,
                    WareNameRom = i.WareName,
                    UnitCode = 5
                }).ToArray();

                return XmlResponseMessage(result);
            }
        }

        [HttpGet]
        [HttpPost]
        [BasicAuthentication]
        public ResponseMessageResult Analogues(int kagId, string number, string brand)
        {
            var ctx = new valmiEntities();

            NomenclatureElement[] result = null;

            var r = ctx.vsspGetWare(null, kagId, null, null, number, brand, true, null).FirstOrDefault();
            if (r != null)
            {
                var foundRows = new ObjectParameter("RowCnt", 1);
                var analogue = ctx.vsspGetWareChange(r.WareId, kagId, null, null, true, null, foundRows, true, false);
                // vsspGetWareReplacements(null, r.WareId, kagId, null, false, out var rowCnt);
                result = analogue.Select(i => new NomenclatureElement
                {
                    Brand = i.ProducerName,
                    WareName = i.WareName,
                    WareId = i.WareId,
                    UnitName = i.UnitShName,
                    WareNum = i.WareNum,
                    Price = i.PriceOut ?? 0,
                    WareNameRom = i.WareName,
                    UnitCode = 5
                }).ToArray();
            }
            /*
                    var ctx = new CatalogRepository();
        
                    NomenclatureElement[] result = null;
        
                    var r = ctx.GetWare(null, brand, number, kagId, null);
                    if (r != null)
                    {
                        var analogue = ctx.GetWareReplacements(null, r.Id, kagId, null, false, out var rowCnt);
                        result = analogue.Select(i => new NomenclatureElement
                        {
                            Brand = i.ProducerName,
                            WareName = i.Name,
                            WareId = i.Id,
                            UnitName = i.MeasureUnit,
                            WareNum = i.WareNum,
                            Price = i.ClientPrice ?? 0,
                            WareNameRom = i.Name,
                            UnitCode = 5
                        }).ToArray();
        
                    }
                    */
            return XmlResponseMessage(result);
        }


        [HttpGet]
        [HttpPost]
        [BasicAuthentication]
        public ResponseMessageResult KagList()
        {
            using (var ctx = new AutomallContext())
            {
                var user = ctx.vsUsers.Include("Presentations").FirstOrDefault(i => i.Login == ((HttpListenerBasicIdentity)Thread.CurrentPrincipal.Identity).Name);

                if (user == null)
                    return ResponseMessage(new HttpResponseMessage(HttpStatusCode.Forbidden));

                using (var cubeCtx = new CubeContext())
                {
                    var clients =
                        cubeCtx.vsspGetClientsInfo(string.Join(",", user.Presentations.Select(i => i.ClientId)), null);
                    var result = clients.Select(i => new Kag { KagId = i.KagId, KagName = i.KagName }).ToArray();
                    return XmlResponseMessage(result);
                }
            }
        }


        [HttpGet]
        [HttpPost]
        [BasicAuthentication]
        public ResponseMessageResult Orders(string startDate, string endDate, int kagId)
        {
            var user = GetUser(kagId);
            if (user == null)
                return ForbiddenResponseMessage;

            var ctx = new valmiEntities();

            var result = ctx.vsspGetOrderList(kagId, null, 
                DateTime.TryParseExact(startDate, "ddMMyyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out var dateBeg) ? (DateTime?) dateBeg : null,
                DateTime.TryParseExact(endDate, "ddMMyyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out var dateEnd) ? (DateTime?)dateEnd : null, null, null, null).ToArray();

            return XmlResponseMessage(result);

        }

        [HttpGet]
        [HttpPost]
        [BasicAuthentication]
        public ResponseMessageResult Order(int orderId, int kagId)
        {
            var user = GetUser(kagId);
            if (user == null)
                return ForbiddenResponseMessage;

            var ctx = new valmiEntities();

            var result = new Order
            {
                OrderData = ctx.vsspGetOrderData(kagId, null, null).FirstOrDefault(),
                OrderPositions = ctx.vsspGetOrderPositions(orderId, kagId, null).ToArray()
            };
            
            return XmlResponseMessage(result);
        }

        [HttpPost]
        [BasicAuthentication]
        public ResponseMessageResult CreateOrder(int orderId, int kagId)
        {
            var user = GetUser(kagId);
            if (user == null)
                return ForbiddenResponseMessage;

            var ctx = new valmiEntities();

            var result = ctx.vsspCreateOrder(kagId, null, user.Id, null).FirstOrDefault();


            return XmlResponseMessage(result);
        }

        // ReSharper disable once RedundantAssignment
        private vsUser GetUser(int kagId)
        {
            var user = GetUser();
            return user != null && user.Presentations.Any(i => i.ClientId == kagId) ? user : null;
        }

        private ResponseMessageResult ForbiddenResponseMessage => ResponseMessage(new HttpResponseMessage(HttpStatusCode.Forbidden));

        // ReSharper disable once RedundantAssignment
        private vsUser GetUser()
        {
            using (var ctx = new AutomallContext())
            {
                return ctx.vsUsers.Include("Presentations").FirstOrDefault(i => i.Login == ((HttpListenerBasicIdentity)Thread.CurrentPrincipal.Identity).Name);
            }
        }

        private Kag[] GetKagList()
        {
            using (var amCtx = new AutomallContext())
            {
                var user = amCtx.vsUsers.Include("Presentations").FirstOrDefault(i => i.Login == ((HttpListenerBasicIdentity)Thread.CurrentPrincipal.Identity).Name);

                if (user == null)
                    return null;

                using (var cubeCtx = new CubeContext())
                {
                    var clients =
                        cubeCtx.vsspGetClientsInfo(string.Join(",", user.Presentations.Select(i => i.ClientId)), null);
                    return clients.Select(i => new Kag { KagId = i.KagId, KagName = i.KagName }).ToArray();
                }
            }
        }
        private ResponseMessageResult XmlResponseMessage<T>(T result)
        {
            return ResponseMessage(new HttpResponseMessage(HttpStatusCode.OK)
            {
                Content = new ObjectContent<T>(result,
                    new System.Net.Http.Formatting.XmlMediaTypeFormatter
                    {
                        UseXmlSerializer = true
                    })
            });
        }

    }
}