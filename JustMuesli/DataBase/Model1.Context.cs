﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace JustMuesli.DataBase
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class JustMuesliEntities : DbContext
    {
        public JustMuesliEntities()
            : base("name=JustMuesliEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Country> Country { get; set; }
        public virtual DbSet<Ingredient> Ingredient { get; set; }
        public virtual DbSet<Muesli> Muesli { get; set; }
        public virtual DbSet<MuesliMix> MuesliMix { get; set; }
        public virtual DbSet<MuesliMixMuesli> MuesliMixMuesli { get; set; }
        public virtual DbSet<Order> Order { get; set; }
        public virtual DbSet<OrderMuesli> OrderMuesli { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Type> Type { get; set; }
        public virtual DbSet<User> User { get; set; }
    }
}
