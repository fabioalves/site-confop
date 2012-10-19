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
    public class SecaoController : BaseController
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Admin/Secao/

        public ViewResult Index()
        {
            int siteId = MvcApplication.GetSiteId();
            var secao = db.Secao.Include(s => s.Site).Where(s => s.SiteId == siteId);
            return View(secao.ToList());
        }

        //
        // GET: /Admin/Secao/Details/5

        public ViewResult Details(int id)
        {
            Secao secao = db.Secao.Find(id);
            return View(secao);
        }

        //
        // GET: /Admin/Secao/Create

        public ActionResult Create()
        {
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome");
            return View();
        } 

        //
        // POST: /Admin/Secao/Create

        [HttpPost]
        public ActionResult Create(Secao secao)
        {
            if (ModelState.IsValid)
            {
                db.Secao.Add(secao);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", secao.SiteId);
            return View(secao);
        }
        
        //
        // GET: /Admin/Secao/Edit/5
 
        public ActionResult Edit(int id)
        {
            Secao secao = db.Secao.Find(id);
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", secao.SiteId);
            return View(secao);
        }

        //
        // POST: /Admin/Secao/Edit/5

        [HttpPost]
        public ActionResult Edit(Secao secao)
        {
            if (ModelState.IsValid)
            {
                db.Entry(secao).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", secao.SiteId);
            return View(secao);
        }

        //
        // GET: /Admin/Secao/Delete/5
 
        public ActionResult Delete(int id)
        {
            Secao secao = db.Secao.Find(id);
            return View(secao);
        }

        //
        // POST: /Admin/Secao/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Secao secao = db.Secao.Find(id);
            db.Secao.Remove(secao);
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