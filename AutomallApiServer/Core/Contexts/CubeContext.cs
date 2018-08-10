using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using AutomallApiServer.Core.Contexts.ResultModels;
using AutomallApiServer.Models.Cube;
// ReSharper disable InconsistentNaming

namespace AutomallApiServer.Core.Contexts
{
    public class CubeContext : DbContext
    {
        public CubeContext() : base("name=CubeContext")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }

        public virtual ps_GetRingGroupByCallerIDResult GetRingGroupByCallerId(string callerId)
        {

            var sqlQuery = "ps_GetRingGroupByCallerID @CallerID";

            object[] sqlParams =
            {
                new SqlParameter
                {
                    ParameterName = "@CallerID",
                    Value = callerId,
                    Direction = ParameterDirection.Input
                },
                //new SqlParameter { ParameterName = "@RingGroup",  Value =idFormulario, Direction = System.Data.ParameterDirection.Input },
                //new SqlParameter { ParameterName = "@CallerName",  Value =-99, Direction = System.Data.ParameterDirection.Output },
            };

            var result = Database.SqlQuery<ps_GetRingGroupByCallerIDResult>(sqlQuery, sqlParams).SingleOrDefault();
            return result;

        }

        public virtual IList<vsWareInfo> vsspGetWaresList(int? groupId, int? markId, int? modelId, int? modifId, int? kagId, string prodIds, int? priceFrom, int? priceTo, string properties, string culture,
    bool? onlyPrices, bool? onlyOnStock, string name, int? filId, bool? isAction, bool? calcPrcRst, int? fromNum, int? count, int? sortBy,
    out int foundRows, out int? minPrice, out int? maxPrice, out string brandIds)
        {
            var foundRowsParameter = new SqlParameter("@FoundRows", SqlDbType.Int) { Direction = ParameterDirection.Output, Value = DBNull.Value};
            var minPriceParameter = new SqlParameter("@MinPrice", SqlDbType.Int) { Direction = ParameterDirection.InputOutput, Value = (object)priceFrom ?? DBNull.Value };
            var maxPriceParameter = new SqlParameter("@MaxPrice", SqlDbType.Int) { Direction = ParameterDirection.InputOutput, Value = (object)priceTo ?? DBNull.Value };
            var prodIdsParameter = new SqlParameter("@ProdIds", SqlDbType.VarChar, -1) { Direction = ParameterDirection.InputOutput, Value = (object)prodIds ?? DBNull.Value };

            object[] sqlParams =
            {
                new SqlParameter("@GroupId", (object) groupId ?? DBNull.Value),
                new SqlParameter("@MarkaId", (object) markId ?? DBNull.Value),
                new SqlParameter("@ModelId", (object) modelId ?? DBNull.Value),
                new SqlParameter("@ModifId", (object) modifId ?? DBNull.Value),
                new SqlParameter("@KagId", (object) kagId ?? DBNull.Value),
                prodIdsParameter,
                minPriceParameter,
                maxPriceParameter,
                new SqlParameter("@Properties", (object) properties ?? DBNull.Value),
                new SqlParameter("@Culture", (object) culture ?? DBNull.Value),
                new SqlParameter("@OnlyPrices", (object) onlyPrices ?? DBNull.Value),
                new SqlParameter("@OnlyOnStock", (object) onlyOnStock ?? DBNull.Value),
                new SqlParameter("@Name", (object) name ?? DBNull.Value),
                new SqlParameter("@SaleDirId", SqlDbType.Int) {Value = DBNull.Value},
                new SqlParameter("@FilId", (object) filId ?? DBNull.Value),
                new SqlParameter("@isAction", (object) isAction ?? DBNull.Value),
                new SqlParameter("@CalcPrcRst", (object) calcPrcRst ?? DBNull.Value),
                foundRowsParameter,
                new SqlParameter("@FromNum", (fromNum ?? 0) + 1),
                new SqlParameter("@Count", (object) count ?? DBNull.Value),
                new SqlParameter("@SortBy", (object) sortBy ?? DBNull.Value)
            };
            var result = Database.SqlQuery<vsWareInfo>("vsspGetWaresListBySomeConditions @GroupId, @MarkaId, @ModelId, @ModifId, " +
                                                       "@KagId, @ProdIds out, @MinPrice out, @MaxPrice out, @Properties, @Culture, @OnlyPrices, @OnlyOnStock, " +
                                                       "@Name, @SaleDirId, @FilId, @isAction, @CalcPrcRst, @FoundRows out, @FromNum, @Count, @SortBy", sqlParams).ToList();

            foundRows = (int)foundRowsParameter.Value;
            minPrice = (int?)(minPriceParameter.Value == DBNull.Value ? null : minPriceParameter.Value);
            maxPrice = (int?)(maxPriceParameter.Value == DBNull.Value ? null : maxPriceParameter.Value);
            brandIds = (string)(prodIdsParameter.Value == DBNull.Value ? null : prodIdsParameter.Value);
            return result;
        }
    }
}

