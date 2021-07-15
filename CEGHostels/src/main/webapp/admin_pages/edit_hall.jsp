
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<% String id=request.getParameter("id");%>
<% 

Class.forName("com.mysql.cj.jdbc.Driver");   
Connection conn=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select * from Hall where hid="+id;
ResultSet rs = stmt.executeQuery(query);
rs.next();

%>
<h3 style="text-align: center"> Enter new values </h3>
<%
if(request.getParameter("message")!=null){
    out.println("<div class='warning' >"+request.getParameter("message")+"</div>");
}
else{
    out.println("</br>");
}
%>
<form action="modify_hall.jsp">
<table style="margin-left: auto;margin-right: auto">
    <%
    out.println("<tr><td>Hall ID</td>");
    out.println("<td><input type=text value='"+rs.getInt("hid")+"' name='id' readonly/>");
    out.println("<tr><td>Hall Name</td>");
    out.println("<td><input type=text value='"+rs.getString("name")+"' name='name' required/>");
    out.println("<tr><td>Provost</td>");
    out.println("<td><input type=text value='"+rs.getString("provost")+"' name='provost' required/>");
    out.println("<tr><td>Number of Hostels</td>");
    out.println("<td><input type=text value='"+rs.getInt(3)+"' name='' readonly/>");
    %>
    <tr>
        <td><input type="submit" value="Update"/></td>
    </tr>
</table>
</form>
</html>
