<%-- 
    Document   : hall_info
    Created on : 6 Nov, 2012, 11:45:48 PM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
  <div class="heading">List of Halls<br/></div>  
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select * from Hall";
ResultSet rs = stmt.executeQuery(query);
%>
<table border="1">
    <thead>
    <tr>
    <th>Hall ID</th>
    <th>Name</th>
    <th>Number of Employees</th>
    <th>Number of Hostels</th>
    </tr>
    </thead>
    <%
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        out.println("<td>"+rs.getString("name")+"</td>");
        out.println("<td>"+rs.getInt(3)+"</td>");
        out.println("<td>"+rs.getInt(4)+"</td>");
        out.println("</tr>");
               }
out.println("<br/>");
%>
</table>
<%
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>

</html>
