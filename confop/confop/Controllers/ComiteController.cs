using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Models;

namespace confop.Controllers
{
    public class ComiteController : Controller
    {
        private ModelContainer db = new ModelContainer();
        //
        // GET: /Comite/

        public ActionResult Index()
        {
            int siteId = MvcApplication.GetSiteId();
            var comites = db.Comite.Where(s => s.SiteId == siteId);
            return View(comites.ToList());
        }       
    }
}
