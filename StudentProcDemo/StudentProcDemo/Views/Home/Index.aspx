<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title>Index</title>
</head>
<body>
    <div>
        <%
            System.Data.DataTable dt = Session["allstu"] as System.Data.DataTable;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Response.Write(dt.Rows[i]["StudentNo"] + "&nbsp;" + dt.Rows[i]["StudentName"] + "&nbsp;");
                string url = Url.Content("~/User/Edit?id=" + dt.Rows[i]["StudentNo"]);
                Response.Write("<a href=\""+url+"\">修改</a>");
                Response.Write("<br/>"); 
            }
           %>
    </div>
</body>
</html>
