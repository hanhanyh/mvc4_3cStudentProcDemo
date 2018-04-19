using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using System.Data;
namespace StudentProcDemo.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
           DataTable dt= StudentBLL.selectall();
           Session["allstu"] = dt;
            return View();
        }

    }
}
