using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TOProjects.Models;

namespace TOProjects
{
    public class HelperClass
    {
        List<string> CustName = new List<string>();
        private ProjectsEntities db = new ProjectsEntities();
        public void AddNewContact(int[] Contact, string[] cc_id,string Action)
        {
            int iid;
            if (Action == "Create")
            {
                 iid = (db.Leads.OrderByDescending(c => c.Id).Select(c => c.Id).First());
            }
            else
            {
                 iid = Convert.ToInt32(Action);
            }
            
            List<Except> aList = new List<Except>();
            List<Except> bList = new List<Except>();
            if (Contact != null)
            {
                foreach (var item in Contact)
            {



                int? a = db.LeadContactTables.Where(c => c.LeadID == iid && c.CustomerID == item).Select(c => c.CustomerID).FirstOrDefault();
                int? b = db.LeadContactTables.Where(c => c.LeadID == iid && c.CustomerID == item).Select(c => c.LeadID).FirstOrDefault();
                aList.Add(
                    new Except
                    {
                        CustomerID = a
                    ,
                        LeadID = b
                    }
                    );

            }
            }
            else
            {
                //db.LeadContactTables.Add(new LeadContactTable
                //{

                //    CustomerID = nameid,
                //    LeadID = iid,
                //    ccID = null

                //});
            }
            bList.Add(
                  new Except
                  {
                      CustomerID = db.LeadContactTables.Where(c => c.LeadID == iid).Select(c => c.CustomerID).FirstOrDefault()
                  ,
                      LeadID = db.LeadContactTables.Where(c => c.LeadID == iid).Select(c => c.LeadID).FirstOrDefault()
                  }
                  );
       var deleteContact =      bList.Except(aList);
            if (deleteContact != null)
            {


                foreach (var item in deleteContact)
                {
                    db.LeadContactTables.RemoveRange(db.LeadContactTables.Where(x => x.LeadID == item.LeadID && x.CustomerID == item.CustomerID));
                    db.SaveChanges();

                }
            }


            //add delete all entries 

            db.LeadContactTables.RemoveRange(db.LeadContactTables.Where(x => x.LeadID == iid));
            db.SaveChanges();

            if (Contact != null)
            {


                foreach (var item in Contact)
                {
                    //check if value exist
                  //  int iid = (db.Leads.OrderByDescending(c => c.Id).Select(c => c.Id).First());
                    int? checkID = db.LeadContactTables.Where(c => c.CustomerID == item && c.LeadID == iid).Select(c => c.CustomerID).FirstOrDefault();

                    int AllContacts = db.CustomerContacts.Select(c => c.ContactId).Count();
                    int AllContactsForCustomer = db.CustomerContacts.Where(c=> c.CustomerId ==item).Select(c => c.ContactId).Count();
                    var checkName = new List<string>();
                    var checkCustomerID = new List<int>();
                    if (cc_id != null)
                    {
                        for (int i = 0; i < cc_id.Length; i++)
                        {
                            checkName.Add(cc_id[i].Split(',')[1]);
                            checkCustomerID.Add(Convert.ToInt32(cc_id[i].Split(',').First()));

                        }
                    }
                    //add if value doesnt exits
                    if (checkID == null)
                    {
                        //Create entries for all customers chosen on the lead create screen

                        for (int i = 0; i < Contact.Length; i++)
                        {
                           
                            int ContactL = Contact[i];
                            string checkLeadName = db.Customers.Where(c => c.Id == ContactL).Select(c => c.Name).FirstOrDefault();
                           
                            //add null check
                            if (cc_id != null)
                            {
                               
                                    db.LeadContactTables.Add(new LeadContactTable
                                    {

                                        CustomerID = ContactL,
                                        LeadID = iid,
                                        ccID = null

                                    });

                               
                            for (int Iii = 0; Iii < cc_id.Length; Iii++)
                            {

                                for (int Ii = 0; Ii < AllContacts; Ii++)
                                {
                                        if (checkLeadName == cc_id[Iii].Split(',')[1])
                                        {

                                       
                                        db.LeadContactTables.Add(new LeadContactTable
                                        {

                                            CustomerID = ContactL,
                                            LeadID = iid,
                                            ccID = Convert.ToInt32(cc_id[Iii].Split(',')[0])

                                    });
                                        }

                                    }
                                /////
                               
                            }
                            }
                            else
                            {
                                for (int Ii = 0; Ii < AllContacts; Ii++)
                                {
                                  

                                   

                                    int nameid = Contact[i];


                                    db.LeadContactTables.Add(new LeadContactTable
                                    {

                                        CustomerID = nameid,
                                        LeadID = iid,
                                        ccID = null

                                    });
                                }
                            }


                        }
                        db.SaveChanges();

                    }
                }



            }
            db.SaveChanges();
        }

        public string GenerateContact(string addItem, string theCustomerID, int LeadID,string AllChecked)
        {
           
            string result = "";

            if (addItem == "true" )
            {
                result += "<div id='" + theCustomerID + "'>";

            

                var CustomerJoin =
                
                (from cc in db.CustomerContacts
                 join c in db.Contacts on cc.ContactId equals c.Id
                 join cm in db.Customers on cc.CustomerId equals cm.Id
                 join lct in db.LeadContactTables on cc.CustomerId equals lct.CustomerID
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
                     ,
                     ContactID = cc.ContactId
                     ,leadid = lct.LeadID
                     
                 }).Distinct().Where(p => p.Name == theCustomerID && p.CustomerID != null && p.leadid == LeadID).DefaultIfEmpty(); //produces flat sequence

                var count = (from cc in db.CustomerContacts
                            join c in db.Contacts on cc.ContactId equals c.Id
                join cm in db.Customers on cc.CustomerId equals cm.Id
                select new
                {
                    Name = cm.Name
                ,
                    CustomerID = cc.CustomerId
                    ,
                    ContactID = cc.ContactId
                }).Where(p => p.Name == theCustomerID && p.CustomerID != null).Count();
                int i = 0;
                if (count == 0)
                {
                    if (AllChecked == "Details")
                    {
                        result += "<table class='table' >";
                        result += "<tbody>";
                        result += "<tr scope='row' >";
                        result += "<td><b>Customer</b></td>";
                        result += "<td><b>" + theCustomerID + "</b></td>";
                        result += "<td>&nbsp;</td>";
                        result += "</tr>";
                        result += "<tr scope='row'>";
                        result += "<td>&nbsp;</td>";
                        result += "<td>&nbsp;</td>";
                        result += "<td>No associated contacts</td>";
                        result += "</tr>";
                        result += "</tbody>";
                        result += "</table>";
                    }
                    else
                    {
                        result += "<table class='table'><tr><th><h3>";
                        result += "<Input type='checkbox' style='display:none' name='NameContact' value='" + theCustomerID + "'checked>";
                        result += theCustomerID + " </h3></th></tr><tr><th scope ='row'> No associated contacts </th></tr></table></div>";
                    }
                }
                else
                {
                   
                    foreach (var item in CustomerJoin)
                {

                    i++;
                        if (i == 1)
                        {
                            if (AllChecked == "Details")
                            {

                            }
                            else
                            {

                            

                            result += "<table class='table'><tr><th><h3>";
                            result += "<Input type='checkbox' style='display:none' name='Contact' value='" + item.CustomerID + "'checked>";
                            result += item.Name + "</h3></th></tr>";
                            result += @"
  <tr>
 <th scope='row'>Contacts</th>
    <th> First Name </th>
    <th> Last Name </th>
    <th> Email </th>
    <th> Work Phone </th>
    <th> Mobile Phone </th>
    <th> Title </th>
     <th> Notes </th>
  </tr>";

                        }
                           


                            foreach (var inner in CustomerJoin)
                            {

                               
                                int? check;
                                string addcheck = "";
                                string Display = "";
                                if (LeadID == 0)
                                {
                                    check = db.LeadContactTables.Where(c => c.ccID == inner.ContactID && c.CustomerID == item.CustomerID).Select(c => c.ccID).FirstOrDefault();
                                }
                                else
                                {
                                    check = db.LeadContactTables.Where(c => c.ccID == inner.ContactID && c.CustomerID == item.CustomerID && c.LeadID == LeadID).OrderByDescending(c=> c.ccID).Select(c => c.ccID).FirstOrDefault();
                                    

                                }

                                if (check != null || AllChecked == "Create")
                                {
                                    addcheck = "checked";
                                }
                                else
                                    if (check == null && AllChecked == "Details")
                                {
                                    Display = "style='display:none;'";
                                    

                                }
                                else
                                {
                                    addcheck = "";

                                }
                                if (AllChecked == "Details")
                                {
                                    if (Display != "style='display:none;'")
                                    {
                                        if (!CustName.Contains(item.Name))
                                        {

                                            
                                            CustName.Add(item.Name);

                                            result += "<table class='table' >";
                                            result += "<tbody>";
                                            result += "<tr scope='row' >";
                                            result += "<td><b>Customer</b></td>";
                                            result += "<td><b>" + item.Name + "</b></td>";
                                            result += "<td>&nbsp;</td>";
                                            result += "</tr>";
                                        }

                                        CustName.Add(item.Name);
                                       
                                        result += "<tr scope='row' " + Display + ">";
                                        result += "<td><b>Contacts</b></td>";
                                        result += "<td>First Name </td>";
                                        result += "<td>" + inner.FirstName + "</td>";
                                        result += "</tr>";
                                        result += "<tr scope='row' " + Display + ">";
                                        result += "<td>&nbsp;</td>";
                                        result += "<td>Last Name</td>";
                                        result += "<td>" + inner.LastName + "</td>";
                                        result += "</tr>";
                                        result += "<tr scope='row' " + Display + ">";
                                        result += "<td>&nbsp;</td>";
                                        result += "<td>Email</td>";
                                        result += "<td>" + inner.Email + "</td>";
                                        result += "</tr>";
                                        result += "<tr scope='row' " + Display + ">";
                                        result += "<td>&nbsp;</td>";
                                        result += "<td>Mobile Phone</td>";
                                        result += "<td>" + inner.MobilePhone + "</td>";
                                        result += "</tr>";
                                        result += "<tr scope='row' " + Display + ">";
                                        result += "<td>&nbsp;</td>";
                                        result += "<td>Work Phone</td>";
                                        result += "<td>@" + inner.WorkPhone + "</td>";
                                        result += "</tr>";
                                        result += "<tr scope='row' " + Display + ">";
                                        result += "<td>&nbsp;</td>";
                                        result += "<td>Title</td>";
                                        result += "<td>" + inner.Title + "</td>";
                                        result += "</tr>";
                                        result += "<tr scope='row' " + Display + ">";
                                        result += "<td>&nbsp;</td>";
                                        result += "<td>Notes</td>";
                                        result += "<td>" + inner.Notes + "</td>";
                                        result += "</tr>";
                                        result += "</tbody>";
                                    }
                                    else
                                    {
                                       int checker = db.LeadContactTables.Where(c => c.CustomerID == item.CustomerID && c.LeadID == LeadID && c.ccID !=null ).OrderByDescending(c => c.ccID).Select(c => c.ccID).Distinct().Count();
                                        var dblcheck =
                                              (from cc in db.CustomerContacts
                                               join c in db.Contacts on cc.ContactId equals c.Id
                                               join cm in db.Customers on cc.CustomerId equals cm.Id
                                               join lct in db.LeadContactTables on cc.CustomerId equals lct.CustomerID
                                               select new
                                               {

                                                   Name = cm.Name
                                               ,

                                                   ccid = lct.ccID
                                                   ,leadID = lct.LeadID
                                               }).Where(p => p.Name == theCustomerID && p.leadID ==LeadID ).Distinct().ToList();

                                        var x = result.Contains(@"Customer</b></td><td><b>"+item.Name);
                                       int dbl = CustomerJoin.Where(c => c.Name == item.Name && c.ContactID != null).Distinct().Count();
                                        if ( checker<dbl-checker )
                                        {
                                            

                                               result += "<table class='table' >";
                                            result += "<tbody>";
                                            result += "<tr scope='row' >";
                                            result += "<td><b>Customer</b></td>";
                                            result += "<td><b>" + item.Name + "</b></td>";
                                            result += "<td>&nbsp;</td>";
                                            result += "</tr>";
                                            result += "<tr scope='row'>";
                                            result += "<td>&nbsp;</td>";
                                            result += "<td>&nbsp;</td>";
                                            result += "<td>No Contacts Checked</td>";
                                            result += "</tr>";
                                            result += "</tbody>";
                                            result += "</table>";
                                        }

                                    }

                                }
                                else
                                {



                                    result += "<tr scope='row' " + Display + ">";
                                    result += "<td> <Input type='checkbox' name='cc_id' value='" + inner.ContactID + "," + item.Name + "'" + addcheck + "> </td>";
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
                            }
                        result += "</table></div>";
                    }
                }
            }


            }

            return result;
        }
        public void AddContacts(int[] Contact, int[] cc_id,string[] cc_idName ,Lead lead, int[] CustomerId)
        {


            if (Contact != null)
            {


                foreach (var item in Contact)
                {
                    //check if value exist
                    int iid = (db.Leads.OrderByDescending(c => c.Id).Select(c => c.Id).First());
                    int? checkID = db.LeadContactTables.Where(c => c.CustomerID == item && c.LeadID == iid).Select(c => c.CustomerID).FirstOrDefault();

                    int AllContacts = db.CustomerContacts.Select(c => c.ContactId).Count();
                    var checkName = new List<string>();
                    var checkCustomerID = new List<int>();
                    if (cc_id != null)
                    {
                        for (int i = 0; i < cc_id.Length; i++)
                        {
                            checkName.Add(cc_idName[i].Split(',')[1]);
                            checkCustomerID.Add(Convert.ToInt32(cc_idName[i].Split(',').First()));

                        }
                    }
                    //add if value doesnt exits
                    if (checkID == null)
                    {
                        //Create entries for all customers chosen on the lead create screen

                        for (int i = 0; i < Contact.Length; i++)
                        {
                            int? ccid;
                            int ContactL = Contact[i];
                            string checkLeadName = db.Customers.Where(c => c.Id == ContactL).Select(c => c.Name).FirstOrDefault();
                            //add null check
                            for (int Iii = 0; Iii < cc_id.Length; Iii++)
                            {

                                for (int Ii = 0; Ii < AllContacts; Ii++)
                                {
                                    db.LeadContactTables.Add(new LeadContactTable
                                    {

                                        CustomerID = ContactL,
                                        LeadID = iid,
                                        ccID = null

                                    });

                                }
                                /////
                                if (checkLeadName == checkName[Iii])
                                {

                                    ccid = checkCustomerID[Iii];

                                    int nameid = Contact[i];


                                    db.LeadContactTables.Add(new LeadContactTable
                                    {

                                        CustomerID = nameid,
                                        LeadID = iid,
                                        ccID = ccid

                                    });
                                }
                            }


                        }
                        db.SaveChanges();

                    }
                }



            }
            //check if any contact is checked 
            if (Contact != null && CustomerId !=null)
            {
                //get all unchecked contacts and remove from LeadContact Table
                var equal = Contact.ToList();
                var dnequal = CustomerId.ToList();
                if (cc_id != null)
                {
                    var checkEquals = cc_id.ToList();
                    List<int> checkdnEquals = new List<int>();
                    foreach (var item in equal)
                    {

                        checkEquals.Add(db.v_lead_contact.Where(c => c.CustomerID == item && c.LeadID == lead.Id).Select(c => c.cc_ID).FirstOrDefault());
                        var subUnchecked = checkEquals.Except(checkdnEquals);
                        var some = db.LeadContactTables.Where(x => x.LeadID == lead.Id && x.CustomerID == item).ToList();
                        foreach (var unitem in subUnchecked)
                        {
                            some.ForEach(a => a.ccID = unitem);
                        }


                        db.SaveChanges();
                    }
                }
                else
                {
                    var some = db.LeadContactTables.Where(x => x.LeadID == lead.Id).ToList();
                    some.ForEach(a => a.ccID = null);
                    db.SaveChanges();
                }



                var allCustomersForThisLeadId = from c in db.LeadCustomers where c.LeadId == lead.Id select c;
                db.LeadCustomers.RemoveRange(allCustomersForThisLeadId);
                db.SaveChanges();

                var UncheckedContacts = dnequal.Except(equal);
                foreach (var item in UncheckedContacts)
                {
                    List<int> ld = db.LeadContactTables.Where(c => c.LeadID == lead.Id && c.CustomerID == item).Select(c => c.ContactID).ToList();
                    foreach (var itemld in ld)
                    {
                        LeadContactTable customer = new LeadContactTable() { ContactID = itemld };
                        db.LeadContactTables.Attach(customer);
                        db.LeadContactTables.Remove(customer);
                        db.SaveChanges();
                    }

                }

            }
            else
            {
                List<int> ld = db.LeadContactTables.Where(c => c.LeadID == lead.Id).Select(c => c.ContactID).ToList();
                foreach (var item in ld)
                {
                    LeadContactTable customer = new LeadContactTable() { ContactID = item };
                    db.LeadContactTables.Attach(customer);
                    db.LeadContactTables.Remove(customer);
                    db.SaveChanges();

                }


            }
            //Adds values

            //add customer contact table 
            int id = (db.Leads.OrderByDescending(c => c.Id).Select(c => c.Id).First());
            if (cc_id != null)
            {


                for (int ii = 0; ii < Contact.Length; ii++)
                {
                    int nameid = Contact[ii];

                    for (int i = 0; i < cc_id.Length; i++)
                    {
                        int ccid = cc_id[i];
                        int? cc = db.CustomerContacts.Where(c => c.CustomerId == nameid && c.ContactId == ccid).Select(c =>
                             c.ContactId
                               ).FirstOrDefault();
                        if (cc != null)
                        {
                            db.LeadContactTables.Add(new LeadContactTable
                            {

                                CustomerID = nameid,
                                LeadID = id,
                                ccID = cc
                            });


                        }


                    }
                }
            }

            db.SaveChanges();
        }

    }
}