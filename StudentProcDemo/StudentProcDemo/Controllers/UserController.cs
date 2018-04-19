using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using Model;
using System.Data;
namespace StudentProcDemo.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Edit(int id)
        {
            DataTable dt = BLL.StudentBLL.selectone(id);
            Session["stu"] = dt;
            return View();
        }
        [HttpPost]
        public ActionResult Edit(int id,string name,string phone)
        { 
           Student s=new Student();
            s.StudnetNo=id;
            s.StudentName=name;
            s.Phone=phone;
           int re= BLL.StudentBLL.edit(s);
           if (re == 1)
               return Content("修改成功");
           return Content("修改失败");
        }

    }
}
