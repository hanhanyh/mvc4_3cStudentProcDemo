using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
namespace DAL
{
    public class SQLHELPER
    {
        public static string conf = ConfigurationManager.ConnectionStrings["MYSQL"].ConnectionString;
        /// <summary>
        /// 返回首行首列
        /// </summary>
        /// <param name="sqltext"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string sqltext)
        {
            using (SqlConnection conn = new SqlConnection(conf))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand(sqltext, conn);
                return comm.ExecuteScalar();

            }
        }
        /// <summary>
        /// 返回受影响行数
        /// </summary>
        /// <param name="sqltext"></param>
        /// <returns></returns>
        public static object ExecuteNonQuery(string sqltext)
        {
            using (SqlConnection conn = new SqlConnection(conf))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand(sqltext,conn);
                return comm.ExecuteNonQuery();
            }
        }
        /// <summary>
        /// 返回结果集
        /// </summary>
        /// <param name="sqltext"></param>
        /// <returns></returns>
        public static DataSet ExecuteDataSet(string sqltext)
        {
            using (SqlConnection conn = new SqlConnection(conf))
            {
                conn.Open();
                DataSet dataset = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(sqltext, conn);
                adapter.Fill(dataset);
                return dataset;
            }
        }
        /// <summary>
        /// 执行存储过程返回 dataset
        /// </summary>
        /// <param name="sqltext">存储过程</param>
        /// <param name="param">sqlparam参数</param>
        /// <returns></returns>
        public static DataSet ExecuteDataSetBYStoredProc(string sqltext, SqlParameter[] param=null)
        {
            using (SqlConnection conn = new SqlConnection(conf))
            {
                conn.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(sqltext, conn);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
               if(param!=null)adapter.SelectCommand.Parameters.AddRange(param);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                return ds;

            }
        }
        /// <summary>
        /// 执行存储过程返回受影响行数
        /// </summary>
        /// <param name="sqltext">sql语句</param>
        /// <param name="param">参数</param>
        /// <returns></returns>
        public static int ExecuteNoQueryBYStoredProc(string sqltext, SqlParameter[] param=null)
        {
            using (SqlConnection conn = new SqlConnection(conf))
            {
                conn.Open();
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandText = sqltext;
                comm.CommandType = CommandType.StoredProcedure;
                if (param != null) comm.Parameters.AddRange(param);
                return  comm.ExecuteNonQuery();
            }
        }

    }
}
