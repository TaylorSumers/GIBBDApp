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
    
    public partial class Insurance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Insurance()
        {
            this.Driver_Insurance = new HashSet<Driver_Insurance>();
        }
    
        public int InsuranceID { get; set; }
        public Nullable<int> InsuranceCar { get; set; }
        public Nullable<int> InsuranceCompany { get; set; }
        public decimal InsurancePayment { get; set; }
    
        public virtual Car Car { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Driver_Insurance> Driver_Insurance { get; set; }
        public virtual InsuranceCompany InsuranceCompany1 { get; set; }
    }
}
