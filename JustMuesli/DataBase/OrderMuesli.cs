//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class OrderMuesli
    {
        public int MuesliId { get; set; }
        public int OrderId { get; set; }
        public Nullable<bool> Size { get; set; }
        public string Quantity { get; set; }
        public string TotalPrice { get; set; }
    
        public virtual MuesliMix MuesliMix { get; set; }
        public virtual Order Order { get; set; }
    }
}
