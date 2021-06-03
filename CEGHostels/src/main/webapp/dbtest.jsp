<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
    Connection conn=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String uname=request.getParameter("username");
String passwd=request.getParameter("password");
String query="select * from accounts where uname='"+uname+"' and passwd='"+passwd+"'";
ResultSet rs = stmt.executeQuery(query);
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>