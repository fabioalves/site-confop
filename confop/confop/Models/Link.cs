//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace confop.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Link
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Url { get; set; }
        public int SiteId { get; set; }
    
        public virtual Site Site { get; set; }
    }
}
