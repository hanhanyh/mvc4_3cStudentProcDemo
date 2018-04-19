using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using DAL;
using System.Data;
namespace BLL
{
  public class StudentBLL
    {
      public static int Add(Student stu)
      {
          return DAL.StudentService.Add(stu);
      }
      public static DataTable selectall()
      {
          return DAL.StudentService.selectall().Tables[0];
      }
      public static int edit(Student stu)
      {
          return DAL.StudentService.Update(stu);
          
      }
      public static DataTable selectone(int id)
      {
          return DAL.StudentService.selectStuById(id).Tables[0];
      }
    }
}
