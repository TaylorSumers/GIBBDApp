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
    
    public partial class Passport
    {
        public int PassportID { get; set; }
        public int PassportSeries { get; set; }
        public int PassportNum { get; set; }
        public int PassportIssueOrg { get; set; }
        public int PassportDriver { get; set; }
    
        public virtual DocumentsIssueOrganization DocumentsIssueOrganization { get; set; }
        public virtual Driver Driver { get; set; }
    }
}