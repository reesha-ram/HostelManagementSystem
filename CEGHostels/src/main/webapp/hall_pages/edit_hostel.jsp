
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
String query="select * from Hostel where hid="+id;
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
<form action="update_hostel.jsp">
<table style="">
    <%
    out.println("<tr><td>Hostel ID</td>");
    out.println("<td><input type=text value='"+rs.getInt("hid")+"' name='id' readonly/>");
    out.println("<tr><td>Hostel Name</td>");
    out.println("<td><input type=text value='"+rs.getString("name")+"' name='name' required/>");
    out.println("<tr><td>Care taker</td>");
    out.println("<td><input type=text value='"+rs.getString("care_taker")+"' name='care_taker' required/>");
    out.println("<tr><td>Accomodation Facility</td>");
    out.println("<td><input type=text value='"+rs.getInt("capacity")+"' name='capacity' required/>");
    out.println("<tr><td>Number of Rooms</td>");
    out.println("<td><input type=text value='"+rs.getInt("no_of_rooms")+"' name='no_of_rooms' required/>");
    out.println("<tr><td>Mess capacity</td>");
    out.println("<td><input type=text value='"+rs.getInt("mess_capacity")+"' name='mess_capacity' required/>");
    out.println("<tr><td>Mess Contractor</td>");
    out.println("<td><input type=text value='"+rs.getString("mess_contractor")+"' name='mess_contractor' required/>");
    %>
    <tr>
        <td><input type="submit" value="Update"/></td>
    </tr>
</table>
</form>
</html>
