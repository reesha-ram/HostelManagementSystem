
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
    String id=request.getParameter("id");
    String visitor_name=request.getParameter("name");
    String entry_time=request.getParameter("entry_time");
    %>
    <%
  
try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="update Visitors set exit_time=(select now()) where "
 + "sid="+id+" and "
 + "name='"+visitor_name+"' and "
 + "entry_time='"+entry_time+"'";
stmt.executeUpdate(query);

conn.close();
         %>
<jsp:forward page="visitor_book.jsp" >
  <jsp:param name="message" value="Visitor Signed out" />
  <jsp:param name="type" value="success"/>
</jsp:forward>
<%
}catch(Exception e)
{
out.println(e.toString());
}
%>
	    
</html>
