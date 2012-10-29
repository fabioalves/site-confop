using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Models;

namespace confop.Controllers
{
    public class HomeController : Controller
    {
        private ModelContainer db = new ModelContainer();
        public ActionResult Index()
        {
            var secao = db.Secao.Find(1);            
            return View(secao);
        }





        
    }
}
