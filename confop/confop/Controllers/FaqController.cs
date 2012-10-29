using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Models;

namespace confop.Controllers
{
    public class FaqController : Controller
    {
        private ModelContainer db = new ModelContainer();
        //
        // GET: /Faq/

        public ActionResult Index()
        {
            int siteId = MvcApplication.GetSiteId();
            var faqs = db.Faq.Where(s => s.SiteId == siteId);
            return View(faqs);
        }

    }
}
