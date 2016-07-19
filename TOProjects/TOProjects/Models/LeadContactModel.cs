using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TOProjects.Models
{
    public class LeadContactModel
    {
       
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string Address { get; set; }
        public Nullable<System.DateTime> BidDueDate { get; set; }
        public Nullable<System.DateTime> BidOpeningDate { get; set; }
        public Nullable<System.DateTime> FollowUpDate { get; set; }
        public string Quantity { get; set; }
        public string Name { get; set; }
        public int[] Contact { get; set; }

        public virtual Employee Employee { get; set; }
        public virtual LeadSource LeadSource { get; set; }
        public virtual LeadStatu LeadStatu { get; set; }
        public virtual LeadType LeadType { get; set; }
        public virtual Project Project { get; set; }
        public virtual Lead Lead1 { get; set; }
        public virtual Lead Lead2 { get; set; }
    }
}