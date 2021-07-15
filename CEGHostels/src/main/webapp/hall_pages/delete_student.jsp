<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="delete from Student where sid="+request.getParameter("id");
stmt.executeUpdate(query);
conn.close();
%>
         <jsp:forward page="student_info.jsp" >
  <jsp:param name="message" value="Student deleted Successfully" />
  <jsp:param name="type" value="success"/>
</jsp:forward>
<%
}catch(Exception e)
{
out.println(e.toString());
}
%>