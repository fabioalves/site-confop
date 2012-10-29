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
    public class GrupoTrabalhoController : BaseController
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Admin/GrupoTrabalho/

        public ViewResult Index(int? id)
        {
            if (id != null)
            {
                var editgrupo = db.GrupoTrabalho.Find(id);
                ViewBag.GrupoEdit = editgrupo;
            }

            var grupotrabalho = db.GrupoTrabalho.Include(g => g.Site);
            return View(grupotrabalho.ToList());
        }


        

        //
        // POST: /Admin/GrupoTrabalho/Create

        [HttpPost]
        public ActionResult Create(GrupoTrabalho grupotrabalho)
        {
            grupotrabalho.SiteId = MvcApplication.GetSiteId();
            if (ModelState.IsValid)
            {
                db.GrupoTrabalho.Add(grupotrabalho);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", grupotrabalho.SiteId);
            return View(grupotrabalho);
        }
        
       

        //
        // POST: /Admin/GrupoTrabalho/Edit/5

        [HttpPost]
        public ActionResult Edit(GrupoTrabalho grupotrabalho)
        {
            if (ModelState.IsValid)
            {
                db.Entry(grupotrabalho).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SiteId = new SelectList(db.Site, "Id", "Nome", grupotrabalho.SiteId);
            return View(grupotrabalho);
        }

        //
        // GET: /Admin/GrupoTrabalho/Delete/5
 
        public ActionResult Delete(int id)
        {
            GrupoTrabalho grupotrabalho = db.GrupoTrabalho.Find(id);
            return View(grupotrabalho);
        }

        //
        // POST: /Admin/GrupoTrabalho/Delete/5

        public ActionResult DeleteConfirmed(int id)
        {            
            GrupoTrabalho grupotrabalho = db.GrupoTrabalho.Find(id);
            db.GrupoTrabalho.Remove(grupotrabalho);
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