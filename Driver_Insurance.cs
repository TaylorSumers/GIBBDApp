//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GIBBDApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class Driver_Insurance
    {
        public int ID { get; set; }
        public int Insurance { get; set; }
        public int Driver { get; set; }
    
        public virtual Driver Driver1 { get; set; }
        public virtual Insurance Insurance1 { get; set; }
    }
}
