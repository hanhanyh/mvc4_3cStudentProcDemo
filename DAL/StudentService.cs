using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Model;
namespace DAL
{
    public class StudentService
    {
        /// <summary>
        /// 查询所有学生信息
        /// </summary>
        /// <returns></returns>
        public static DataSet selectall()
        {
            return SQLHELPER.ExecuteDataSetBYStoredProc("selectAllStu");
        }
        /// <summary>
        /// 查询学生信息通过ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet selectStuById(int id)
        {
            SqlParameter []param={
                                   new SqlParameter("@id", DbType.Int32)
                                 };
            param[0].Value=id;
            return SQLHELPER.ExecuteDataSetBYStoredProc("selectstubyid",param);
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="stu"></param>
        public static int  Update(Student stu)
        {
            SqlParameter []param={
                               new SqlParameter("@id",SqlDbType.Int),
                              new SqlParameter("@name",SqlDbType.NVarChar,20),
                               new SqlParameter("@phone", SqlDbType.NVarChar, 20),
                            new SqlParameter("@address", SqlDbType.NVarChar, 20)
                                 };
            param[0].Value=stu.StudnetNo;
            param[1].Value=stu.StudentName;
            param[2].Value=stu.Phone;
            param[3].Value="四川成都";
            return SQLHELPER.ExecuteNoQueryBYStoredProc("updatenamephoneaddressbyid",param);
        }
        /// <summary>
        /// 添加学生
        /// </summary>
        /// <param name="stu"></param>
        /// <returns></returns>
        public static int Add(Student stu)
        {
            SqlParameter[] param = {
                                      new SqlParameter("@id",SqlDbType.Int),
                                       new SqlParameter("@name",SqlDbType.NVarChar,20),
                                        new SqlParameter("@address", SqlDbType.NVarChar, 20)
                                   };
            param[0].Value = stu.StudnetNo;
            param[1].Value = stu.StudentName;
            param[2].Value = stu.Address;
            ////
            return SQLHELPER.ExecuteNoQueryBYStoredProc("createstu", param);
        }
    }
}
