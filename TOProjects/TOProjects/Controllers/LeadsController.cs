using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TOProjects.Models;
using PagedList;


namespace TOProjects.Controllers
{
    public class LeadsController : Controller
    {
        private ProjectsEntities db = new ProjectsEntities();



        [HttpPost]
        public JsonResult ShowContacts(string addItem, string theCustomerID)
        {
            string result = "";

            if (addItem == "true")
            {
                result += "<div id='" + theCustomerID + "'>";

                //            var leads = db.Leads.Include(l => l.Employee).Include(l => l.LeadSource).Include(l => l.LeadStatu).Include(l => l.LeadType).Include(l => l.Project);
                var theContactIDs = db.CustomerContacts.Where(c => theCustomerID == c.CustomerId.ToString()).Select(cc => cc.ContactId.ToString().ToUpper()).ToList();
                var theContacts = db.Contacts.Where(co => theContactIDs.Contains(co.Id.ToString().ToUpper()));
                var theCustomers = db.Customers.Where(d => theCustomerID == d.Id.ToString());

                //Should be just 1
                foreach (Customer item in theCustomers)
                {
                    //Create A new Section
                    result += "<h3>" + item.Name + "</h3>";

                    //Add All of the contacts to the page
                    foreach (Contact inner in theContacts)
                    {
                        result += "<tr>";
                        result += "<td>" + inner.FirstName + "</td>";
                        result += "<td>" + inner.Email + "</td>";
                        result += "<td>" + inner.LastName + "</td>";
                        result += "<td>" + inner.MobilePhone + "</td>";
                        result += "<td>" + inner.WorkPhone + "</td>";
                        result += "<td>" + inner.Title + "</td>";
                        result += "<td>" + inner.Notes + "</td>";
                        result += "<tr><br>";
                    }
                    result += "</div>";
                }
            }

            return Json(result, JsonRequestBehavior.AllowGet);
            //            return Json("", JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult LeadNewCustomer(string NewCustomer)
        {
            //            var leads = db.Leads.Include(l => l.Employee).Include(l => l.LeadSource).Include(l => l.LeadStatu).Include(l => l.LeadType).Include(l => l.Project);

            Customer theNewCustomer = new Customer();
            theNewCustomer.Name = NewCustomer;
            db.Customers.Add(theNewCustomer);
            db.SaveChanges();

            return Json("", JsonRequestBehavior.AllowGet);
        }
























        [HttpPost]
        public JsonResult LeadAutoComplete(string Prefix, string LeadField)
        {
            var leads = db.Leads.Include(l => l.Employee).Include(l => l.LeadSource).Include(l => l.LeadStatu).Include(l => l.LeadType).Include(l => l.Project);

            
            if (LeadField == "Address")
            {
                var result = (from L in leads where L.Address.Contains(Prefix) select new { Name = L.Address }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
          //  else if (LeadField == "Customer")
            //{
              //  var result = (from L in leads where L.Customer.Name.Contains(Prefix) select new { Name = L.Customer.Name }).Distinct();
                //return Json(result, JsonRequestBehavior.AllowGet);
           // }
         /*   else if (LeadField == "CustomerInsInfo")
            {
                var result = (from L in leads where L.CustomerInsInfo.Contains(Prefix) select new { Name= L.CustomerInsInfo }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }*/
            else if (LeadField == "Employee")
            {
                var result = (from L in leads where L.Employee.FirstName.Contains(Prefix) select new { Name = L.Employee.FirstName }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            else if (LeadField == "Name")
            {
                var result = (from L in leads where L.Name.Contains(Prefix) select new { Name = L.Name }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            else if (LeadField == "Project")
            {
                var result = (from L in leads where L.Project.Name.Contains(Prefix) select new { Name = L.Project.Name }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            else if (LeadField == "Quantity")
            {
                var result = (from L in leads where L.Quantity.Contains(Prefix) select new { Name = L.Quantity }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
           /* else if (LeadField == "SendCreditApp")
            {
                var result = (from L in leads where L.SendCreditApp.ToString().Contains(Prefix) select new { Name = L.SendCreditApp.ToString() }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }*/
            else if (LeadField == "Source")
            {
                var result = (from L in leads where L.LeadSource.Name.Contains(Prefix) select new { Name = L.LeadSource.Name }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            else if (LeadField == "Status")
            {
                var result = (from L in leads where L.LeadStatu.Name.Contains(Prefix) select new { Name = L.LeadStatu.Name }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }
            else if (LeadField == "Type")
            {
                var result = (from L in leads where L.LeadType.Name.Contains(Prefix) select new { Name = L.LeadType.Name }).Distinct();
                return Json(result, JsonRequestBehavior.AllowGet);
            }



            return Json("", JsonRequestBehavior.AllowGet);
        }


        

        // GET: Leads
        public ActionResult Index(string sortOrder, string searchStringValue, string searchStringValue2, string LeadField, int? page)
        {
            bool a = false;
            bool b = false;
            if(searchStringValue == null || searchStringValue =="")
            {
                searchStringValue = "";
                a = true;
            }
            if(searchStringValue2==null || searchStringValue2 == "")
            {
                searchStringValue2 = "";
                b = true;
            }

            bool emptyFilter = false;
            if(a && b)
            {
                emptyFilter = true;
            }

            ViewBag.searchStringValue = searchStringValue;
            ViewBag.searchStringValue2 = searchStringValue2;
            ViewBag.LeadField = LeadField;
        


            var leads = db.Leads.Include(l => l.Employee).Include(l => l.LeadSource).Include(l => l.LeadStatu).Include(l => l.LeadType).Include(l => l.Project);

            DateTime temp = new DateTime();
            DateTime temp2 = new DateTime();

            try
            {
                 temp = DateTime.Parse(searchStringValue);
                 temp2 = DateTime.Parse(searchStringValue2);
            }
            catch (Exception)
            {
                temp = DateTime.Parse("01/01/1900");
                temp2 = DateTime.Parse("01/01/2090");
            }

            if(!emptyFilter)
            { 
            switch (LeadField)
            {
                case "Address":
                    leads = leads.Where(p => p.Address.Contains(searchStringValue));
                    break;
                case "BidDue":
                  
                    leads = leads.Where(p => p.BidDueDate >= temp && p.BidDueDate <= temp2);
                    break;
               
                case "Created":
                           leads = leads.Where(p => p.CreatedDate >= temp && p.CreatedDate <= temp2);
                    break;
                case "BidOpening":
                           leads = leads.Where(p => p.BidOpeningDate >= temp && p.BidOpeningDate <= temp2);
                    break;
                /*case "Customer":
                           leads = leads.Where(p => p.Customer.Name.Contains(searchStringValue));
                    break;*/
               /* case "CustomerInsInfo":
                           leads = leads.Where(p => p.CustomerInsInfo.Contains(searchStringValue));
                    break;*/
                case "Employee":
                           leads = leads.Where(p => p.Employee.FirstName.Contains(searchStringValue));
                    break;
                case "FollowUp":
                           leads = leads.Where(p => p.FollowUpDate >= temp && p.FollowUpDate <= temp2);
                    break;
                case "Name":
                           leads = leads.Where(p => p.Name.Contains(searchStringValue));
                    break;
                case "Project":
                           leads = leads.Where(p => p.Project.Name.Contains(searchStringValue));
                    break;
                case "Quantity":
                           leads = leads.Where(p => p.Quantity.Contains(searchStringValue));
                    break;
               /* case "SendCreditApp":
                           leads = leads.Where(p => p.SendCreditApp.ToString().Contains(searchStringValue));
                    break; */
                case "Source":
                           leads = leads.Where(p => p.LeadSource.Name.Contains(searchStringValue));
                    break;
                case "Status":
                           leads = leads.Where(p => p.LeadStatu.Name.Contains(searchStringValue));
                    break;
                case "Type":
                           leads = leads.Where(p => p.LeadType.Name.Contains(searchStringValue));
                    break;
                default:
                 break;
            }
            }


            ViewBag.LeadStatusSortParm = String.IsNullOrEmpty(sortOrder) ? "status_desc" : "";
            ViewBag.NameSortParm = sortOrder == "name" ? "name_desc" : "name";
            ViewBag.AddressSortParm = sortOrder == "address" ? "address_desc" : "address";
            ViewBag.SendCreditAppSortParm = sortOrder == "SendCreditApp" ? "SendCreditApp_desc" : "SendCreditApp";
            ViewBag.CustomerInsInfoSortParm = sortOrder == "CustomerInsInfo" ? "CustomerInsInfo_desc" : "CustomerInsInfo";
            ViewBag.CreatedDateSortParm = sortOrder == "CreatedDate" ? "CreatedDate_desc" : "CreatedDate";
            ViewBag.BidOpeningDateSortParm = sortOrder == "BidOpeningDate" ? "BidOpeningDate_desc" : "BidOpeningDate";
            ViewBag.BidDueDateSortParm = sortOrder == "BidDueDate" ? "BidDueDate_desc" : "BidDueDate";
            ViewBag.FollowUpDateSortParm = sortOrder == "FollowUpDate" ? "FollowUpDate_desc" : "FollowUpDate";
            ViewBag.QuantitySortParm = sortOrder == "Quantity" ? "Quantity_desc" : "Quantity";
            ViewBag.CustomerNameSortParm = sortOrder == "Customer" ? "Customer_desc" : "Customer";
            ViewBag.EmployeeNameSortParm = sortOrder == "Employee" ? "Employee_desc" : "Employee";
            ViewBag.LeadSourceSortParm = sortOrder == "Source" ? "Source_desc" : "Source";
            ViewBag.LeadTypeSortParm = sortOrder == "Type" ? "Type_desc" : "Type";
            ViewBag.ProjectSortParm = sortOrder == "Project" ? "Project_desc" : "Project";

            switch (sortOrder)
            {
                case "status_desc":
                    leads = leads.OrderByDescending(p => p.LeadStatu.Name);
                    break;
                case "name":
                    leads = leads.OrderBy(p => p.Name);
                    break;
                case "name_desc":
                    leads = leads.OrderByDescending(p => p.Name);
                    break;
                case "address":
                    leads = leads.OrderBy(p => p.Address);
                    break;
                case "address_desc":
                    leads = leads.OrderByDescending(p => p.Address);
                    break;
               /* case "SendCreditApp":
                    leads = leads.OrderBy(p => p.SendCreditApp);
                    break;*/
                /*case "SendCreditApp_desc":
                    leads = leads.OrderByDescending(p => p.SendCreditApp);
                    break;*/
               /* case "CustomerInsInfo":
                    leads = leads.OrderBy(p => p.CustomerInsInfo);
                    break;
                case "CustomerInsInfo_desc":
                    leads = leads.OrderByDescending(p => p.CustomerInsInfo);
                    break;*/
                case "CreatedDate":
                    leads = leads.OrderBy(p => p.CreatedDate);
                    break;
                case "CreatedDate_desc":
                    leads = leads.OrderByDescending(p => p.CreatedDate);
                    break;
                case "BidOpeningDate":
                    leads = leads.OrderBy(p => p.BidOpeningDate);
                    break;
                case "BidOpeningDate_desc":
                    leads = leads.OrderByDescending(p => p.BidOpeningDate);
                    break;
                case "BidDueDate":
                    leads = leads.OrderBy(p => p.BidDueDate);
                    break;
                case "BidDueDate_desc":
                    leads = leads.OrderByDescending(p => p.BidDueDate);
                    break;
                case "FollowUpDate":
                    leads = leads.OrderBy(p => p.FollowUpDate);
                    break;
                case "FollowUpDate_desc":
                    leads = leads.OrderByDescending(p => p.FollowUpDate);
                    break;
                case "Quantity":
                    leads = leads.OrderBy(p => p.Quantity);
                    break;
                case "Quantity_desc":
                    leads = leads.OrderByDescending(p => p.Quantity);
                    break;
                /*case "Customer":
                    leads = leads.OrderBy(p => p.Customer.Name);
                    break;*/
               /* case "Customer_desc":
                    leads = leads.OrderByDescending(p => p.Customer.Name);
                    break;*/
                case "Employee":
                    leads = leads.OrderBy(p => p.Employee.FirstName);
                    break;
                case "Employee_desc":
                    leads = leads.OrderByDescending(p => p.Employee.FirstName);
                    break;
                case "Source":
                    leads = leads.OrderBy(p => p.LeadSource.Name);
                    break;
                case "Source_desc":
                    leads = leads.OrderByDescending(p => p.LeadSource.Name);
                    break;
                case "Type":
                    leads = leads.OrderBy(p => p.LeadType.Name);
                    break;
                case "Type_desc":
                    leads = leads.OrderByDescending(p => p.LeadType.Name);
                    break;
                case "Project":
                    leads = leads.OrderBy(p => p.Project.Name);
                    break;
                case "Project_desc":
                    leads = leads.OrderByDescending(p => p.Project.Name);
                    break;
                default:
                    leads = leads.OrderBy(p => p.LeadStatu.Name);
                    break;
            }

            int pageSize = 8;
            int pageNumber = (page ?? 1);


            return View(leads.ToPagedList(pageNumber, pageSize));

//            return View(leads.ToList());
        }

        // GET: Leads/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lead lead = db.Leads.Find(id);
            if (lead == null)
            {
                return HttpNotFound();
            }

            var CustomerIDs = db.LeadCustomers.Where(lc => lc.LeadId == id).Select(lcr => new { CustomerID = lcr.CustomerId });
            var Customers = db.Customers.Select(c => new { CustomerID = c.Id, CustomerName = c.Name }).ToList();
            var CustomersSelected = Customers.Where(z => CustomerIDs.Any(a => a.CustomerID == z.CustomerID)).Select(c => c.CustomerID).ToArray();
            ViewBag.Customers = new MultiSelectList(Customers, "CustomerID", "CustomerName", CustomersSelected);



            return View(lead);
        }

        // GET: Leads/Create
        public ActionResult Create()
        {

            var Customers = db.Customers.Select(c => new { CustomerID = c.Id, CustomerName = c.Name }).ToList();

            ViewBag.Customers = new MultiSelectList(Customers.OrderBy(c=>c.CustomerName), "CustomerID", "CustomerName");
            //ViewBag.CustomerId = new SelectList(db.Customers, "Id", "Name");
            ViewBag.EmployeeId = new SelectList(db.Employees.OrderBy(e => e.FirstName), "Id", "FirstName");
            ViewBag.LeadSourceId = new SelectList(db.LeadSources.OrderBy(ls => ls.Name), "Id", "Name");

            ViewBag.LeadStatusId = new SelectList(db.LeadStatus.OrderBy(s => s.Name), "Id", "Name");




            ViewBag.LeadTypeId = new SelectList(db.LeadTypes.OrderBy(lt=>lt.Name), "Id", "Name");
            ViewBag.ProjectId = new SelectList(db.Projects.OrderBy(p=>p.Name), "Id", "Name");
            return View();
        }

        // POST: Leads/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,LeadSourceId,EmployeeId,ProjectId,LeadTypeId,LeadStatusId,CreatedDate,Address,SendCreditApp,CustomerInsInfo,BidDueDate,BidOpeningDate,FollowUpDate,Quantity,Name")] Lead lead,string NewProject, string CreateCustomProjectCheckBox,string NewCustomerLeadCheckBox, string NewCustomerLead,  List<LeadContact> leadContactList, int[] CustomerId)
        {
            int totalContacts = leadContactList.Count;
            int count = 1; 
            
            foreach (LeadContact item in leadContactList)
            {
                if(count == totalContacts)
                {
                    break; //Ignore last fake row
                }
                db.LeadContacts.Add(item);
                Console.WriteLine(item.Customer);

                count++;

            }

           
            //Create New Project If Requested and use it's id for lead.ProjectId
            if (!string.IsNullOrEmpty(CreateCustomProjectCheckBox) && CreateCustomProjectCheckBox == "Show")
            {
                string y = NewProject;
                Project project = new Project();
                ProjectsEntities db2 = new ProjectsEntities();
                project.Name = NewProject;
                project.Number = "";
                Project Afterproject = db2.Projects.Add(project);
                db2.SaveChanges();
                lead.ProjectId = Afterproject.Id;
            }


            var errors = ModelState
            .Where(x => x.Value.Errors.Count > 0)
            .Select(x => new { x.Key, x.Value.Errors })
            .ToArray();

            if (ModelState.IsValid)
            {
                //We create the new lead
                Lead AfterLead =         db.Leads.Add(lead);
                
                //If New Customer Fill In Was Done then: 1. Create New Customer. 2. Create New Lead Customer (With Customer ID and Lead)
                if (!string.IsNullOrEmpty(NewCustomerLeadCheckBox) && NewCustomerLeadCheckBox == "Show")
                {

                    //New Fill in customer
                    string y = NewCustomerLead;
                    Customer customer = new Customer();
                    ProjectsEntities db3 = new ProjectsEntities();
                    customer.Name = NewCustomerLead;
                    Customer AfterCustomer = db3.Customers.Add(customer);
                    db3.SaveChanges();

                    //LeadCustomer: New Lead + New Customer
                    LeadCustomer lc = new LeadCustomer();
                    lc.LeadId = AfterLead.Id;
                    lc.CustomerId = AfterCustomer.Id;
                    db.LeadCustomers.Add(lc);



                }

                if (CustomerId != null)
                {
                    //Create entries for all customers chosen on the lead create screen
                    foreach (int theInt in CustomerId)
                    {
                        LeadCustomer lc = new LeadCustomer();
                        lc.LeadId = AfterLead.Id;
                        lc.CustomerId = theInt;
                        db.LeadCustomers.Add(lc);
                    }
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }

           // ViewBag.CustomerId = new SelectList(db.Customers, "Id", "Name", lead.CustomerId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "FirstName", lead.EmployeeId);
            ViewBag.LeadSourceId = new SelectList(db.LeadSources, "Id", "Name", lead.LeadSourceId);
            ViewBag.LeadStatusId = new SelectList(db.LeadStatus, "Id", "Name", lead.LeadStatusId);
            ViewBag.LeadTypeId = new SelectList(db.LeadTypes, "Id", "Name", lead.LeadTypeId);
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", lead.ProjectId);
            return View(lead);
        }

        // GET: Leads/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lead lead = db.Leads.Find(id);
            if (lead == null)
            {
                return HttpNotFound();
            }

            
            var CustomerIDs = db.LeadCustomers.Where(lc => lc.LeadId == id).Select(lcr => new { CustomerID = lcr.CustomerId });
            var Customers = db.Customers.Select(c => new { CustomerID = c.Id, CustomerName = c.Name }).ToList();

            var CustomersSelected = Customers.Where(z=> CustomerIDs.Any(a => a.CustomerID == z.CustomerID)).Select(c =>  c.CustomerID).ToArray();

            ViewBag.Customers = new MultiSelectList(Customers, "CustomerID", "CustomerName",CustomersSelected);

            // ViewBag.CustomerId = new SelectList(db.Customers, "Id", "Name", lead.CustomerId);
            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "FirstName", lead.EmployeeId);
            ViewBag.LeadSourceId = new SelectList(db.LeadSources, "Id", "Name", lead.LeadSourceId);
            ViewBag.LeadStatusId = new SelectList(db.LeadStatus, "Id", "Name", lead.LeadStatusId);
            ViewBag.LeadTypeId = new SelectList(db.LeadTypes, "Id", "Name", lead.LeadTypeId);
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", lead.ProjectId);
            return View(lead);
        }

        // POST: Leads/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,LeadSourceId,EmployeeId,ProjectId,LeadTypeId,LeadStatusId,CreatedDate,Address,SendCreditApp,CustomerInsInfo,BidDueDate,BidOpeningDate,FollowUpDate,Quantity,Name")] Lead lead, int[] CustomerId)
        {

            // db.LeadCustomers.RemoveRange()

            var allCustomersForThisLeadId = from c in db.LeadCustomers where c.LeadId == lead.Id select c;
            db.LeadCustomers.RemoveRange(allCustomersForThisLeadId);
            db.SaveChanges();

            if (CustomerId != null)
            {
                //Create entries for all customers chosen on the lead create screen
                foreach (int theInt in CustomerId)
                {
                    LeadCustomer lc = new LeadCustomer();
                    lc.LeadId = lead.Id;
                    lc.CustomerId = theInt;
                    db.LeadCustomers.Add(lc);
                }
            }
            if (ModelState.IsValid)
            {
                db.Entry(lead).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            // ViewBag.CustomerId = new SelectList(db.Customers, "Id", "Name", lead.CustomerId);




            db.SaveChanges();


            ViewBag.EmployeeId = new SelectList(db.Employees, "Id", "FirstName", lead.EmployeeId);
            ViewBag.LeadSourceId = new SelectList(db.LeadSources, "Id", "Name", lead.LeadSourceId);
            ViewBag.LeadStatusId = new SelectList(db.LeadStatus, "Id", "Name", lead.LeadStatusId);
            ViewBag.LeadTypeId = new SelectList(db.LeadTypes, "Id", "Name", lead.LeadTypeId);
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", lead.ProjectId);
            return View(lead);
        }

        // GET: Leads/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lead lead = db.Leads.Find(id);
            if (lead == null)
            {
                return HttpNotFound();
            }
            return View(lead);
        }

        // POST: Leads/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lead lead = db.Leads.Find(id);
            db.Leads.Remove(lead);
            try
            {
                db.SaveChanges();
            }
            catch (Exception eo)
            {

                
            }
            
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
