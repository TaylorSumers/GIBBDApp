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
    
    public partial class VehiclePassport
    {
        public int VehiclePassportID { get; set; }
        public int VehiclePassportCar { get; set; }
        public string VehiclePassportNum { get; set; }
        public string EngineNum { get; set; }
        public string CarGovNum { get; set; }
        public int CarBrand { get; set; }
        public Nullable<int> CarModel { get; set; }
        public int ManufactureYear { get; set; }
    
        public virtual Brand Brand { get; set; }
        public virtual Car Car { get; set; }
        public virtual Model Model { get; set; }
    }
}
