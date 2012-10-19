using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using confop.Areas.Admin.ViewModel;
using confop.Models;

namespace confop.Areas.Admin.Controllers
{
    public class AutenticationController : Controller
    {
        [HttpGet]
        public ActionResult Login()
        {
            return View();

        }

        [HttpPost]
        public ActionResult Login(LoginPageViewModel viewModel, string formUID = null)
        {
            UsuarioController usuarioController = new UsuarioController();
            Usuario usuario = usuarioController.GetUsuario(viewModel.UserName,
                Utility.SecurityUtil.CalculateMd5Hash(viewModel.Password));

            if (usuario != null)
            {
                Utility.SimpleSessionPersister.Username = usuario.Login;
                Utility.SimpleSessionPersister.Id = usuario.Id.ToString();

                return RedirectToAction("Index", "Admin");
            }
            else
            {
                return RedirectToAction("Login");
            }

        }

        public ActionResult Logout()
        {
            Utility.SimpleSessionPersister.Id = null;
            Utility.SimpleSessionPersister.Username = null;

            return RedirectToAction("Login");
        }


    }
}
