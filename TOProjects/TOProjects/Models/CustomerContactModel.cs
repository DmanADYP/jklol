using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TOProjects.Models
{
    public class CustomerContactModel
    {
        //public int Id { get; set; }
        //public Nullable<int> LeadSourceId { get; set; }
        //public Nullable<int> EmployeeId { get; set; }
        //public Nullable<int> ProjectId { get; set; }
        //public Nullable<int> LeadTypeId { get; set; }
        public string FirstName { get; set; }
        public string Email { get; set; }
        public string LastName { get; set; }
        public string MobilePhone { get; set; }
        public string WorkPhone { get; set; }


        public string Title { get; set; }
        public string Notes { get; set; }
        public string Name { get; set; }
        public int CustomerId { get; set; }

    }
}