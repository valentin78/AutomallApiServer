using System.Linq;
using System.Web.Services;
using AutomallApiServer.Core;
using AutomallApiServer.Core.Contexts;
using AutomallApiServer.Models;
using AutomallApiServer.Models.Eurogarage;

namespace AutomallApiServer.WebServices
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class Eurogarage : System.Web.Services.WebService
    {
        [WebMethod]
        public NomenclatureElement[] Nomenclature (AuthenticationToken token, string number)
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


            var user = SecurityHelper.Authorize(token, new [] { SystemRoles.Eurogarage });

            using (var ctx = new CubeContext())
            {
                var r = ctx.vsspGetWaresList(null, null, null, null, null, null, null, null, null, null, null, null, 
                    number, null, null, null, null, null, null,
                    out _, out _, out _, out _);
                return r.Select(i=>new NomenclatureElement
                {
                    Brand = i.ProducerName,
                    WareName = i. WareName,
                    WareId = i.WareId,
                    UnitName = i.UnitShName,
                    WareNum = i.WareNum

                }).ToArray();
            }
        }
    }
}
