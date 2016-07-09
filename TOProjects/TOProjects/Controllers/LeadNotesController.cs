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
    public class LeadNotesController : Controller
    {
        private ProjectsEntities db = new ProjectsEntities();

        // GET: LeadNotes
        public ActionResult Index(int? id)
        {
            //...Have iFrame set url to LeadId=X
            //Get ? LeadId=X and filter only notes for that Lead

            var LeadNotes = db.LeadNotes.Where(m => m.LeadId == id);
            return View(LeadNotes.ToList());
        }

        // GET: LeadNotes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadNote leadNote = db.LeadNotes.Find(id);
            if (leadNote == null)
            {
                return HttpNotFound();
            }
            return View(leadNote);
        }

        // GET: LeadNotes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LeadNotes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,LeadId,Note")] LeadNote leadNote,  int? Parent)
        {
            leadNote.LeadId = Parent;

            if (ModelState.IsValid)
            {
                db.LeadNotes.Add(leadNote);
                db.SaveChanges();
                return RedirectToAction("Index/" + Parent);
            }

            return View(leadNote);
        }

        // GET: LeadNotes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadNote leadNote = db.LeadNotes.Find(id);
            if (leadNote == null)
            {
                return HttpNotFound();
            }
            return View(leadNote);
        }

        // POST: LeadNotes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,LeadId,Note")] LeadNote leadNote, int? Parent)
        {

            leadNote.LeadId = Parent;

            if (ModelState.IsValid)
            {
                db.Entry(leadNote).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index/" + Parent);
            }
            return View(leadNote);
        }

        // GET: LeadNotes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LeadNote leadNote = db.LeadNotes.Find(id);
            if (leadNote == null)
            {
                return HttpNotFound();
            }
            return View(leadNote);
        }

        // POST: LeadNotes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id, string Parent)
        {
            LeadNote leadNote = db.LeadNotes.Find(id);
            db.LeadNotes.Remove(leadNote);
            db.SaveChanges();
            return RedirectToAction("Index/" + Parent);
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
