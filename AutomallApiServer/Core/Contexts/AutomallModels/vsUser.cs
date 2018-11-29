using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace AutomallApiServer.Core.Contexts.AutomallModels
{
    [Table("vsUsers")]
    public class vsUser
    {
        public vsUser()
        {
            this.Presentations = new HashSet<vsClientPresenter>();
        }
    
        public int Id { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Patronimic { get; set; }
        public string Sex { get; set; }
        public DateTime? Birthday { get; set; }
        public string PhoneHome { get; set; }
        public string PhoneMobile { get; set; }
        public int? IMTypeId { get; set; }
        public string IMContact { get; set; }
        public int? CurrentClientId { get; set; }
        public long Roles { get; set; }
        public Guid Guid { get; set; }
        public long Status { get; set; }
        public string Comment { get; set; }
        public bool SendResume { get; set; }
        public System.DateTime RegistrationDate { get; set; }
        public string ValuteId { get; set; }
        public bool SubscribeForPromotions { get; set; }
        public bool ShowRetailPrice { get; set; }
        public int? VinSearchLimit { get; set; }
        public DateTime? VinSearchLimitDate { get; set; }

        public virtual ICollection<vsClientPresenter> Presentations { get; set; }

    }
}
