using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Models;

namespace confop.Areas.Admin.Controllers
{ 
    public class LinkController : Controller
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Admin/Link/

        public ViewResult Index()
        {
            int siteId = MvcApplication.GetSiteId();
            var link = db.Link.Include(l => l.Site).Where(l => l.SiteId == siteId);
            return View(link.ToList());
        }

        //
        // GET: /Admin/Link/Details/5

        public ViewResult Details(int id)
        {
            Link link = db.Link.Find(id);
            return View(link);
        }

        //
        // GET: /Admin/Link/Create

        public ActionResult Create()
        {
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome");
            return View();
        } 

        //
        // POST: /Admin/Link/Create

        [HttpPost]
        public ActionResult Create(Link link)
        {
            link.SiteId = MvcApplication.GetSiteId();
            if (ModelState.IsValid)
            {
                db.Link.Add(link);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", link.SiteId);
            return View(link);
        }
        
        //
        // GET: /Admin/Link/Edit/5
 
        public ActionResult Edit(int id)
        {
            Link link = db.Link.Find(id);
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", link.SiteId);
            return View(link);
        }

        //
        // POST: /Admin/Link/Edit/5

        [HttpPost]
        public ActionResult Edit(Link link)
        {
            if (ModelState.IsValid)
            {
                db.Entry(link).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", link.SiteId);
            return View(link);
        }

        //
        // GET: /Admin/Link/Delete/5
 
        public ActionResult Delete(int id)
        {
            Link link = db.Link.Find(id);
            return View(link);
        }

        //
        // POST: /Admin/Link/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Link link = db.Link.Find(id);
            db.Link.Remove(link);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}