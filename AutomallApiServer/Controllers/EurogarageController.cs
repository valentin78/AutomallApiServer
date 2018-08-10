using System.Linq;
using System.Web.Http;
using System.Web.Http.Results;

using AutomallApiServer.Core;
using AutomallApiServer.Core.Contexts;
using AutomallApiServer.Models;
using AutomallApiServer.Models.Cube;
using AutomallApiServer.Models.Eurogarage;
using Umbraco.Web.WebApi;

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
        [BasicAuthentication(new [] {SystemRoles.Eurogarage})]
        public string Test ()
        {
            return "OK";
        }

        [HttpGet]
        [HttpPost]
        public NomenclatureElement[] Nomenclature(string userName, string password, string number)
        {

            //Название поля   Тип поля    Описание поля
            //Username VarChar(20)	Пользователь
            //    Password    VarChar(20) Пароль
            //    Код VarChar(8)  Код автозапчасти
            //Response
            //    Название поля 1С Тип поля Описание поля
            //    Код VarChar(8)  Код автозапчасти
            //Наименование VarChar(100)	Сокращенное наименование автозапчасти
            //    НаименованиеИностранное VarChar(100)    Переведенное наименование
            //ПолноеНаименование VarChar(100)	Полное наименование автозапчасти
            //    Артикул VarChar(25) Каталожный номер
            //КодЕдИзм VarChar(8)	Код единицы измерения
            //    КодПроизводителя    VarChar(8)  Код производителя

            var user = SecurityHelper.Authorize(new AuthenticationToken
            {
                UserName = userName,
                Password = password
            }, new[] { SystemRoles.Eurogarage });

            using (var ctx = new CubeContext())
            {
                var r = ctx.vsspGetWaresList(null, null, null, null, null, null, null, null, null, null, null, null,
                    number, null, null, null, null, null, null,
                    out _, out _, out _, out _);
                return r.Select(i => new NomenclatureElement
                {
                    Brand = i.ProducerName,
                    WareName = i.WareName,
                    WareId = i.WareId,
                    UnitName = i.UnitShName,
                    WareNum = i.WareNum

                }).ToArray();
            }
        }

        [HttpGet]
        [HttpPost]
        public JsonResult<NomenclatureElement[]> NomenclatureJson (string userName, string password, string number)
        {

            //Название поля   Тип поля    Описание поля
            //Username VarChar(20)	Пользователь
            //    Password    VarChar(20) Пароль
            //    Код VarChar(8)  Код автозапчасти
            //Response
            //    Название поля 1С Тип поля Описание поля
            //    Код VarChar(8)  Код автозапчасти
            //Наименование VarChar(100)	Сокращенное наименование автозапчасти
            //    НаименованиеИностранное VarChar(100)    Переведенное наименование
            //ПолноеНаименование VarChar(100)	Полное наименование автозапчасти
            //    Артикул VarChar(25) Каталожный номер
            //КодЕдИзм VarChar(8)	Код единицы измерения
            //    КодПроизводителя    VarChar(8)  Код производителя

            var user = SecurityHelper.Authorize(new AuthenticationToken
            {
                UserName = userName,
                Password = password
            }, new[] { SystemRoles.Eurogarage });

            using (var ctx = new CubeContext())
            {
                var r = ctx.vsspGetWaresList(null, null, null, null, null, null, null, null, null, null, null, null,
                    number, null, null, null, null, null, null,
                    out _, out _, out _, out _);
                return Json(r.Select(i => new NomenclatureElement
                {
                    Brand = i.ProducerName,
                    WareName = i.WareName,
                    WareId = i.WareId,
                    UnitName = i.UnitShName,
                    WareNum = i.WareNum

                }).ToArray());
            }
        }

    }
}