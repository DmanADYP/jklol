using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TOProjects.Models;
using PagedList;

namespace TOProjects.Controllers
{
    public class ContactsController : Controller
    {
        private ProjectsEntities db = new ProjectsEntities();


        [HttpPost]
        public JsonResult Index2(string Prefix)
        {
            var ObjList = from p in db.Contacts
                          select p;

            //Searching records from list using LINQ query  
            var ContactEmail = (from N in ObjList
                                where N.Email.Contains(Prefix)
                                select new { N.Email });
            return Json(ContactEmail, JsonRequestBehavior.AllowGet);
        }

        // GET: Contacts
        public ActionResult Index(string sortOrder, string searchString, int? page)
        {

            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "email_desc" : "";
            var contacts = from c in db.Contacts
                           select c;

            if (!String.IsNullOrEmpty(searchString))
            {
                contacts = contacts.Where(c => c.Email.Contains(searchString));
            }
            
            switch (sortOrder)
            {
                case "email_desc":
                    contacts = contacts.OrderByDescending(c => c.Email);
                    break;
                default:
                    contacts = contacts.OrderBy(c => c.Email);
                    break;
            }

            int pageSize = 8;
            int pageNumber = (page ?? 1);



            return View(contacts.ToPagedList(pageNumber, pageSize));

           
        }

        // GET: Contacts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // GET: Contacts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Contacts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FirstName,LastName,WorkPhone,MobilePhone,Email,Title,Notes")] Contact contact)
        {
            if (ModelState.IsValid)
            {
                db.Contacts.Add(contact);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(contact);
        }

        // GET: Contacts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Contacts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FirstName,LastName,WorkPhone,MobilePhone,Email,Title,Notes")] Contact contact)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contact).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(contact);
        }

        // GET: Contacts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Contacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Contact contact = db.Contacts.Find(id);
            db.Contacts.Remove(contact);





            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                string y = "3";
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
