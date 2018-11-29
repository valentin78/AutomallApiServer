using ValmiStore.Model.Cube.DataLayer;

namespace AutomallApiServer.Models.Eurogarage
{
    public class Order
    {
        public vsOrderData OrderData { get; set; }
        public vsOrderPosition[] OrderPositions { get; set; }
    }
}