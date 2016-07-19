using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TOProjects.Models;

namespace TOProjects.ViewModel
{
    public class ToprojectsViewModel
    {
        public LeadContactModel lcm { get; set; }
        public Lead ld { get; set; }
        public CustomerContactModel ts { get; set; }
        public List<CustomerContactModel> lts { get; set; }
        public List<v_lead_contact> lvc { get; set; }
        public v_lead_contact vc { get; set; }

        public IEnumerable<SelectListItem> StatusList { get; set; }
    }
}