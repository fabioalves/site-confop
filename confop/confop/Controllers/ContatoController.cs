using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Models;

namespace confop.Controllers
{
    public class ContatoController : Controller
    {
        private ModelContainer db = new ModelContainer();
        private int siteId;
        //
        // GET: /Contato/

        public ContatoController()
        {
            this.siteId = MvcApplication.GetSiteId();
        }

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Send(Contato contato)
        {
            try
            {
                contato.SiteId = this.siteId;
                contato.DataEnvio = DateTime.Now;
                if (ModelState.IsValid)
                {
                    db.Contato.Add(contato);
                    db.SaveChanges();
                    return RedirectToAction("Success");
                }
                else
                {
                    return RedirectToAction("Error", new { errormessage = "Não foi possível enviar a mensagem." });
                }
            }
            catch (Exception ex)
            {
                return RedirectToAction("Error", new { errormessage = "Não foi possível enviar a mensagem. " + ex.Message });
            }
        }

        public ActionResult Success()
        {
            return View();
        }

        public ActionResult Error(string errormessage)
        {
            ViewBag.errormessage = errormessage;
            return View();
        }
    }
}
