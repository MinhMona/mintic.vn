//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NHST.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbl_FeeOrder
    {
        public int ID { get; set; }
        public Nullable<int> LevelID { get; set; }
        public Nullable<int> WareHouseFromID { get; set; }
        public Nullable<int> WareHouseID { get; set; }
        public Nullable<int> ShipppingTypeID { get; set; }
        public Nullable<double> Price { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
    }
}
