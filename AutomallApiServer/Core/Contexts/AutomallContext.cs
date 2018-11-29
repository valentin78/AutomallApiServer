using System.Data.Entity;
using AutomallApiServer.Core.Contexts.AutomallModels;

// ReSharper disable InconsistentNaming

namespace AutomallApiServer.Core.Contexts
{
    public class AutomallContext : DbContext
    {
        public AutomallContext() : base("name=AutomallContext")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }

        public virtual DbSet<vsClientPresenter> vsClientPresenters { get; set; }

        public virtual DbSet<vsUser> vsUsers { get; set; }

    }
}

