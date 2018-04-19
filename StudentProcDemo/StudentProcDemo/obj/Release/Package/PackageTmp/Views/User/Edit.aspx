<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Edit</title>
</head>
<body>
    <div>
        <%
            System.Data.DataTable dt = Session["stu"] as System.Data.DataTable;
             %>
        <form action="<%=Url.Content("~/User/Edit") %>" method="post">
            <input type="hidden" name="id" value="<%=dt.Rows[0]["StudentNo"] %>" />
           姓名： <input type="text" name="name" value="<%=dt.Rows[0]["StudentName"] %>"/>
            手机：<input type"text" name="phone" value="<%=dt.Rows[0]["Phone"] %>"/>
            地址：<input type="text" name="address"value="<%=dt.Rows[0]["Address"] %>" />
            <br />
            <input type="submit" value="修改" />
        </form>
    </div>
</body>
</html>
