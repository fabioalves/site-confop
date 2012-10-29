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
    public class ContatoController : BaseController
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Admin/Contato/

        public ViewResult Index()
        {
            var contato = db.Contato.Include(c => c.Site);
            return View(contato.ToList());
        }

        //
        // GET: /Admin/Contato/Details/5

        public ViewResult Details(int id)
        {
            Contato contato = db.Contato.Find(id);
            return View(contato);
        }

        //
        // GET: /Admin/Contato/Create

        public ActionResult Create()
        {
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome");
            return View();
        } 

        //
        // POST: /Admin/Contato/Create

        [HttpPost]
        public ActionResult Create(Contato contato)
        {
            if (ModelState.IsValid)
            {
                db.Contato.Add(contato);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", contato.SiteId);
            return View(contato);
        }
        
        //
        // GET: /Admin/Contato/Edit/5
 
        public ActionResult Edit(int id)
        {
            Contato contato = db.Contato.Find(id);
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", contato.SiteId);
            return View(contato);
        }

        //
        // POST: /Admin/Contato/Edit/5

        [HttpPost]
        public ActionResult Edit(Contato contato)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contato).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", contato.SiteId);
            return View(contato);
        }

        //
        // GET: /Admin/Contato/Delete/5
 
        public ActionResult Delete(int id)
        {
            Contato contato = db.Contato.Find(id);
            return View(contato);
        }

        //
        // POST: /Admin/Contato/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            Contato contato = db.Contato.Find(id);
            db.Contato.Remove(contato);
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