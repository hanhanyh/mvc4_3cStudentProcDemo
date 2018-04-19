using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
   public class Student
    {
        private int studnetNo;

        public int StudnetNo
        {
            get { return studnetNo; }
            set { studnetNo = value; }
        }
        private string studentName;

        public string StudentName
        {
            get { return studentName; }
            set { studentName = value; }
        }
        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private string phone;

        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
    }
}
