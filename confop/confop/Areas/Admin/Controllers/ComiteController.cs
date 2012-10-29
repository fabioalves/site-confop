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
    [Authorize(Roles = "Administrador")]
    public class ComiteController : BaseController
    {
        private ModelContainer db = new ModelContainer();
        private int siteID;

        public ComiteController()
        {
            this.siteID = MvcApplication.GetSiteId();
        }
        //
        // GET: /Admin/Comite/

        public ViewResult Index()
        {
            var comite = db.Comite.Include(c => c.Site).Where(s => s.SiteId == this.siteID);
            return View(comite.ToList());
        }

        //
        // GET: /Admin/Comite/Details/5

        public ViewResult Details(int id)
        {
            Comite comite = db.Comite.Find(id);
            return View(comite);
        }

        //
        // GET: /Admin/Comite/Create

        public ActionResult Create()
        {
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome");
            return View();
        } 

        //
        // POST: /Admin/Comite/Create

        [HttpPost]
        public ActionResult Create(Comite comite)
        {
            comite.SiteId = this.siteID;
            if (ModelState.IsValid)
            {
                db.Comite.Add(comite);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", comite.SiteId);
            return View(comite);
        }
        
        //
        // GET: /Admin/Comite/Edit/5
 
        public ActionResult Edit(int id)
        {
            Comite comite = db.Comite.Find(id);
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", comite.SiteId);
            return View(comite);
        }

        //
        // POST: /Admin/Comite/Edit/5

        [HttpPost]
        public ActionResult Edit(Comite comite)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comite).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", comite.SiteId);
            return View(comite);
        }

        //
        // GET: /Admin/Comite/Delete/5
 
        public ActionResult Delete(int id)
        {
            Comite comite = db.Comite.Find(id);
            return View(comite);
        }

        //
        // POST: /Admin/Comite/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Comite comite = db.Comite.Find(id);
            db.Comite.Remove(comite);
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