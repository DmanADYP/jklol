using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TOProjects.Models;

namespace TOProjects.Controllers
{
    public class LeadTypesController : Controller
    {
        private ProjectsEntities db = new ProjectsEntities();

        // GET: LeadTypes
        public ActionResult Index()
        {
            return View(db.LeadTypes.ToList());
        }

        // GET: LeadTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadType leadType = db.LeadTypes.Find(id);
            if (leadType == null)
            {
                return HttpNotFound();
            }
            return View(leadType);
        }

        // GET: LeadTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LeadTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] LeadType leadType)
        {
            if (ModelState.IsValid)
            {
                db.LeadTypes.Add(leadType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(leadType);
        }

        // GET: LeadTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadType leadType = db.LeadTypes.Find(id);
            if (leadType == null)
            {
                return HttpNotFound();
            }
            return View(leadType);
        }

        // POST: LeadTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] LeadType leadType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(leadType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(leadType);
        }

        // GET: LeadTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadType leadType = db.LeadTypes.Find(id);
            if (leadType == null)
            {
                return HttpNotFound();
            }
            return View(leadType);
        }

        // POST: LeadTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LeadType leadType = db.LeadTypes.Find(id);
            db.LeadTypes.Remove(leadType);
            db.SaveChanges();
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
