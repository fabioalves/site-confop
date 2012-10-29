using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Models;

namespace confop.Controllers
{
    public class GrupoTrabalhoController : Controller
    {
        private ModelContainer db = new ModelContainer();
        //
        // GET: /GrupoTrabalho/

        public ActionResult Index()
        {
            int siteId = MvcApplication.GetSiteId();
            var grupos = db.GrupoTrabalho.Where(s => s.SiteId == siteId);
            return View(grupos);
        }

    }
}
