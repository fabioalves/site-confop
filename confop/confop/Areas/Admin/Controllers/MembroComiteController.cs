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
    public class MembroComiteController : Controller
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Admin/MembroComite/

        public ViewResult Index(int id)
        {
            ViewBag.ComiteId = id;
            var membrocomite = db.MembroComite.Include(m => m.Comite).Where(c => c.ComiteId == id);
            return View(membrocomite.ToList());
        }

        //
        // GET: /Admin/MembroComite/Details/5

        public ViewResult Details(int id)
        {
            MembroComite membrocomite = db.MembroComite.Find(id);
            return View(membrocomite);
        }

        //
        // GET: /Admin/MembroComite/Create

        public ActionResult Create(int id)
        {
            ViewBag.ComiteId = id;
            return View();
        } 

        //
        // POST: /Admin/MembroComite/Create

        [HttpPost]
        public ActionResult Create(MembroComite membrocomite, int id)
        {
            membrocomite.ComiteId = id;
            if (ModelState.IsValid)
            {
                db.MembroComite.Add(membrocomite);
                db.SaveChanges();
                return RedirectToAction("Index", new { id = id });  
            }

            ViewBag.ComiteId = new SelectList(db.Comite, "Id", "Nome", membrocomite.ComiteId);
            return View(membrocomite);
        }
        
        //
        // GET: /Admin/MembroComite/Edit/5
 
        public ActionResult Edit(int id)
        {
            MembroComite membrocomite = db.MembroComite.Find(id);
            ViewBag.ComiteId = id;
            return View(membrocomite);
        }

        //
        // POST: /Admin/MembroComite/Edit/5

        [HttpPost]
        public ActionResult Edit(MembroComite membrocomite)
        {
            if (ModelState.IsValid)
            {
                db.Entry(membrocomite).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index", new { id = membrocomite.ComiteId });
            }
            return View(membrocomite);
        }

        //
        // GET: /Admin/MembroComite/Delete/5
 
        public ActionResult Delete(int id)
        {
            MembroComite membrocomite = db.MembroComite.Find(id);
            ViewBag.ComiteId = membrocomite.ComiteId;
            return View(membrocomite);
        }

        //
        // POST: /Admin/MembroComite/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            MembroComite membrocomite = db.MembroComite.Find(id);
            int ComiteId = membrocomite.ComiteId;
            db.MembroComite.Remove(membrocomite);
            db.SaveChanges();
            return RedirectToAction("Index", new { id = ComiteId });
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}