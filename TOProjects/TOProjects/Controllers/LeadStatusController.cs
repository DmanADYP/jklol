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
    public class LeadStatusController : Controller
    {
        private ProjectsEntities db = new ProjectsEntities();

        // GET: LeadStatus
        public ActionResult Index()
        {
            return View(db.LeadStatus.ToList());
        }

        // GET: LeadStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadStatu leadStatu = db.LeadStatus.Find(id);
            if (leadStatu == null)
            {
                return HttpNotFound();
            }
            return View(leadStatu);
        }

        // GET: LeadStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LeadStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name")] LeadStatu leadStatu)
        {
            if (ModelState.IsValid)
            {
                db.LeadStatus.Add(leadStatu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(leadStatu);
        }

        // GET: LeadStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadStatu leadStatu = db.LeadStatus.Find(id);
            if (leadStatu == null)
            {
                return HttpNotFound();
            }
            return View(leadStatu);
        }

        // POST: LeadStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name")] LeadStatu leadStatu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(leadStatu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(leadStatu);
        }

        // GET: LeadStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadStatu leadStatu = db.LeadStatus.Find(id);
            if (leadStatu == null)
            {
                return HttpNotFound();
            }
            return View(leadStatu);
        }

        // POST: LeadStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LeadStatu leadStatu = db.LeadStatus.Find(id);
            db.LeadStatus.Remove(leadStatu);
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
