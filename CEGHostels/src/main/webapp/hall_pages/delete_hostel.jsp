<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="delete from Hostel where hid="+request.getParameter("id");
stmt.executeUpdate(query);
query="delete from accounts where h_no="+request.getParameter("id")+" and type=2";
stmt.executeUpdate(query);
query="update Hall set no_of_hostels=no_of_hostels-1 where hid="+session.getAttribute("h_no");
stmt.executeUpdate(query);
conn.close();
%>
         <jsp:forward page="hostel_info.jsp" >
  <jsp:param name="message" value="Hostel deleted Successfully" />
  <jsp:param name="type" value="success"/>
</jsp:forward>
<%
}catch(Exception e)
{
out.println(e.toString());
}
%>