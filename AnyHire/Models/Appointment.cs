//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AnyHire.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Appointment
    {
        public Appointment()
        {
            this.Transactions = new HashSet<Transaction>();
        }
    
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int PackageId { get; set; }
        public string Location { get; set; }
        public System.DateTime Time { get; set; }
        public bool Completed { get; set; }
    
        public virtual Customer Customer { get; set; }
        public virtual Package Package { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; }
    }
}