using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Models;

namespace confop.Controllers
{ 
    public class SecaoController : Controller
    {
        private ModelContainer db = new ModelContainer();

        //
        // GET: /Secao/

        public ViewResult Index(int Id)
        {
            var secao = db.Secao.Find(Id);
            return View(secao);
        }


        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}