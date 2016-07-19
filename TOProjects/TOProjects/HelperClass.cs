using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TOProjects.Models;

namespace TOProjects
{
    public class HelperClass
    {
        private ProjectsEntities db = new ProjectsEntities();
        public string GenerateContact(string addItem, string theCustomerID, int LeadID)
        {
            
            string result = "";

            if (addItem == "true")
            {
                result += "<div id='" + theCustomerID + "'>";

                //            var leads = db.Leads.Include(l => l.Employee).Include(l => l.LeadSource).Include(l => l.LeadStatu).Include(l => l.LeadType).Include(l => l.Project);
                //var theContactIDs = db.CustomerContacts.Where(c => theCustomerID == c.CustomerId.ToString()).Select(cc => cc.ContactId.ToString().ToUpper()).ToList();
                //var theContacts = db.Contacts.Where(co => theContactIDs.Contains(co.Id.ToString().ToUpper()));
                //var theCustomers = db.Customers.Where(d => theCustomerID == d.Id.ToString());


                var CustomerJoin =
   (from cc in db.CustomerContacts
    join c in db.Contacts on cc.ContactId equals c.Id
    join cm in db.Customers on cc.CustomerId equals cm.Id
    select new
    {
        FirstName = c.FirstName
    ,
        Email = c.FirstName
    ,
        LastName = c.LastName
    ,
        MobilePhone = c.MobilePhone
    ,
        WorkPhone = c.WorkPhone
    ,
        Title = c.Title
    ,
        Notes = c.Notes
    ,
        Name = cm.Name
    ,
        CustomerID = cc.CustomerId
        ,ContactID = cc.ContactId
    }).Where(p => p.Name == theCustomerID); //produces flat sequence
                int i = 0;
                foreach (var item in CustomerJoin)
                {
                  
                    i++;
                    if (i == 1)
                    {

                        result += "<table><tr><th><h3> <Input type='checkbox' name='Contact' value='" + item.CustomerID + "'checked>   " + "" + item.Name + "</h3></th></tr>";
                        result += @"
  <tr>
 <th> First Name </th>
    <th> First Name </th>
    <th> Last Name </th>
    <th> Email </th>
    <th> Work Phone </th>
    <th> Mobile Phone </th>
    <th> Title </th>
     <th> Notes </th>
  </tr>";



                        foreach (var inner in CustomerJoin)
                        {
                            int? check;
                            string addcheck;
                            if (LeadID == 0)
                            {
                           check  =  db.LeadContactTables.Where(c => c.ccID == inner.ContactID && c.CustomerID == item.CustomerID ).Select(c => c.ccID).FirstOrDefault();
                            }
                            else
                            {
                            check =    db.LeadContactTables.Where(c => c.ccID == inner.ContactID && c.CustomerID == item.CustomerID && c.LeadID == LeadID).Select(c => c.ccID).FirstOrDefault();
                            }

                            if (check !=null)
                            {
                                addcheck = "checked";
                            }
                            else
                            {
                                addcheck = "";
                            }

                            result += "<tr>";
                            result += "<td> <Input type='checkbox' name='cc_id' value='" + inner.ContactID + "'"+addcheck+"> </td>";
                            result += "<td>" + inner.FirstName + "</td>";

                            result += "<td>" + inner.LastName + "</td>";

                            result += "<td>" + inner.Email + "</td>";

                            result += "<td>" + inner.MobilePhone + "</td>";

                            result += "<td>" + inner.WorkPhone + "</td>";

                            result += "<td>" + inner.Title + "</td>";

                            result += "<td>" + inner.Notes + "</td>";
                            result += "</tr><br>";

                            result += "</div>";
                        }
                        result += "</table></div>";
                    }
                }


            }

            return result;
        }
    }
}