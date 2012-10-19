using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Areas.Admin.ViewModel;
using confop.Models;

namespace confop.Areas.Admin.Controllers
{
    public class AdminController : BaseController
    {
        public ActionResult Index()
        {
            if (Utility.SimpleSessionPersister.Id != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Autentication/Logout");
            }
        }
    }
}
