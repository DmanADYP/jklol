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
    public class ProjectsController : Controller
    {
        private ProjectsEntities db = new ProjectsEntities();

        [HttpPost]
        public JsonResult Index3(string Prefix)
        {
            var ObjList = from p in db.Projects
                          select p; 

            //Searching records from list using LINQ query  
            var ProjectNumber = (from N in ObjList
                               where N.Number.Contains(Prefix)
                               select new { N.Number });
            return Json(ProjectNumber, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]  
       public JsonResult Index2(string Prefix)
       {  
            var ObjList = from p in db.Projects
                           select p;
            
            //Searching records from list using LINQ query  
            var ProjectName = (from N in ObjList
                           where N.Name.Contains(Prefix)
                         select new { N.Name });  
           return Json(ProjectName, JsonRequestBehavior.AllowGet);  
       }  



        // GET: Projects
        public ActionResult Index(string sortOrder, string searchStringName, string searchStringNumber, int? page)
        {

            bool a = false;
            bool b = false;
            if (searchStringName == null || searchStringName == "")
            {
                searchStringName = "";
                a = true;
            }
            if (searchStringNumber == null || searchStringNumber == "")
            {
                searchStringNumber = "";
                b = true;
            }

            bool emptyFilter = false;
            if (a && b)
            {
                emptyFilter = true;
            }

            ViewBag.searchStringName = searchStringName;
            ViewBag.searchStringNumber = searchStringNumber;


            ViewBag.NameSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.NumberSortParm = sortOrder == "number" ? "number_desc" : "number";
            
            var projects = from p in db.Projects
                           select p;

            if (!String.IsNullOrEmpty(searchStringName) && !String.IsNullOrEmpty(searchStringNumber))
            {
                projects = projects.Where(p => p.Name.Contains(searchStringName) || p.Number.Contains(searchStringNumber));
            }
            else if(!String.IsNullOrEmpty(searchStringName) && String.IsNullOrEmpty(searchStringNumber))
            {
                projects = projects.Where(p => p.Name.Contains(searchStringName));
            }
            else if(String.IsNullOrEmpty(searchStringName) && !String.IsNullOrEmpty(searchStringNumber))
            {
                projects = projects.Where(p => p.Number.Contains(searchStringNumber));
            }

            switch (sortOrder)
            {
                case "name_desc":
                    projects = projects.OrderByDescending(p => p.Name);
                    break;
                case "number":
                    projects = projects.OrderBy(p => p.Number);
                    break;
                case "number_desc":
                    projects = projects.OrderByDescending(p => p.Number);
                    break;
                default:
                    projects = projects.OrderBy(p => p.Name);
                    break;
            }

            int pageSize = 8;
            int pageNumber = (page ?? 1);

            

            return View(projects.ToPagedList(pageNumber, pageSize));

            
        }

        // GET: Projects/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        // GET: Projects/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Projects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Number")] Project project)
        {
            if (ModelState.IsValid)
            {
                db.Projects.Add(project);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(project);
        }

        // GET: Projects/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        // POST: Projects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Number")] Project project)
        {
            if (ModelState.IsValid)
            {
                db.Entry(project).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(project);
        }

        // GET: Projects/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        // POST: Projects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Project project = db.Projects.Find(id);
            db.Projects.Remove(project);

            try
            {
                db.SaveChanges();
            }
            catch (Exception)
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
