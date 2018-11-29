using System.ComponentModel.DataAnnotations.Schema;

namespace AutomallApiServer.Core.Contexts.AutomallModels
{
    [Table("vsClientPresenter")]
    public class vsClientPresenter
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int ClientId { get; set; }
        public bool IsAccepted { get; set; }
        public long Roles { get; set; }
        public int CurrentWarehouseId { get; set; }
    
        public virtual vsUser User { get; set; }
    }
}
