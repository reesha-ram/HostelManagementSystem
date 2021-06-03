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
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select a.hid,a.name,a.capacity,a.no_of_rooms,a.mess_contractor,"
 + "a.mess_capacity,b.name,a.care_taker from Hostel a,Hall b where b.hid in(select Hall_id from hostel_hall"
 + " where Hostel_id=a.hid ) and a.hid="+request.getParameter("id");
ResultSet rs = stmt.executeQuery(query);
rs.next();
%>
<h3 style="text-align: center">Hostel Information</h3>
<table style="margin-left: auto;margin-right: auto">
    <tr>
        <td>
            Hostel ID
        </td>
    <%out.println("<td><input type=text value='"+rs.getInt("a.hid")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Name
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.name")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Care Taker
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.care_taker")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Capacity
        </td>
    <%out.println("<td><input type=text value='"+rs.getInt("a.capacity")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Number of Rooms
        </td>
    <%out.println("<td><input type=text value='"+rs.getInt("a.no_of_rooms")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Mess contractor
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.mess_contractor")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Mess capacity
        </td>
    <%out.println("<td><input type=text value='"+rs.getInt("a.mess_capacity")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Hall name
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("b.name")+"' readonly/></tr></td>");%>
    <form action="hostel_info.jsp">
        <tr><td> <input type="submit" value='Go back'/></td></tr>
    </form>
    
</table>
<%
out.println("<br/>");
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>