<%-- 
    Document   : modify_hall
    Created on : 7 Nov, 2012, 2:37:44 PM
    Author     : niyasc
--%>
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
    //out.println(request.getParameter("name"))
  
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");   
    	Connection conn=DriverManager.getConnection(  
    	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="delete from Hall where hid="+request.getParameter("id");
stmt.executeUpdate(query);
query="delete from accounts where h_no="+request.getParameter("id")+" and type=1";
stmt.executeUpdate(query);
conn.close();
    %>
    <jsp:forward page="hall_info.jsp" >
    <jsp:param name="message" value="Hall deleted Successfully" />
    <jsp:param name="type" value="success"/>
    </jsp:forward>
    <%
}catch(Exception e)
{
out.println(e.toString());
}
    %>

</html>
