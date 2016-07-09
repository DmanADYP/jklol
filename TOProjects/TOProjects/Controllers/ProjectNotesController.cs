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
    public class ProjectNotesController : Controller
    {
        private ProjectsEntities db = new ProjectsEntities();

        // GET: ProjectNotes
        public ActionResult Index()
        {
            var projectNotes = db.ProjectNotes.Include(p => p.Project);
            return View(projectNotes.ToList());
        }

        // GET: ProjectNotes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectNote projectNote = db.ProjectNotes.Find(id);
            if (projectNote == null)
            {
                return HttpNotFound();
            }
            return View(projectNote);
        }

        // GET: ProjectNotes/Create
        public ActionResult Create()
        {
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name");
            return View();
        }

        // POST: ProjectNotes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ProjectId,Note")] ProjectNote projectNote)
        {
            if (ModelState.IsValid)
            {
                db.ProjectNotes.Add(projectNote);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", projectNote.ProjectId);
            return View(projectNote);
        }

        // GET: ProjectNotes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectNote projectNote = db.ProjectNotes.Find(id);
            if (projectNote == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", projectNote.ProjectId);
            return View(projectNote);
        }

        // POST: ProjectNotes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ProjectId,Note")] ProjectNote projectNote)
        {
            if (ModelState.IsValid)
            {
                db.Entry(projectNote).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProjectId = new SelectList(db.Projects, "Id", "Name", projectNote.ProjectId);
            return View(projectNote);
        }

        // GET: ProjectNotes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProjectNote projectNote = db.ProjectNotes.Find(id);
            if (projectNote == null)
            {
                return HttpNotFound();
            }
            return View(projectNote);
        }

        // POST: ProjectNotes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProjectNote projectNote = db.ProjectNotes.Find(id);
            db.ProjectNotes.Remove(projectNote);
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
