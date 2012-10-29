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
    public class FaqController : BaseController
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Admin/Faq/

        public ViewResult Index()
        {
            int siteId = MvcApplication.GetSiteId();
            var faq = db.Faq.Include(f => f.Site).Where(f => f.SiteId == siteId);
            return View(faq.ToList());
        }

        //
        // GET: /Admin/Faq/Details/5

        public ViewResult Details(int id)
        {
            Faq faq = db.Faq.Find(id);
            return View(faq);
        }

        //
        // GET: /Admin/Faq/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Admin/Faq/Create

        [HttpPost]
        public ActionResult Create(Faq faq)
        {
            faq.SiteId = MvcApplication.GetSiteId();
            if (ModelState.IsValid)
            {
                db.Faq.Add(faq);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", faq.SiteId);
            return View(faq);
        }
        
        //
        // GET: /Admin/Faq/Edit/5
 
        public ActionResult Edit(int id)
        {
            Faq faq = db.Faq.Find(id);
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", faq.SiteId);
            return View(faq);
        }

        //
        // POST: /Admin/Faq/Edit/5

        [HttpPost]
        public ActionResult Edit(Faq faq)
        {
            if (ModelState.IsValid)
            {
                db.Entry(faq).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", faq.SiteId);
            return View(faq);
        }

        //
        // GET: /Admin/Faq/Delete/5
 
        public ActionResult Delete(int id)
        {
            Faq faq = db.Faq.Find(id);
            return View(faq);
        }

        //
        // POST: /Admin/Faq/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Faq faq = db.Faq.Find(id);
            db.Faq.Remove(faq);
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