
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <%
    String name=request.getParameter("uname");
    if(name==null||name.equals("")){
    %>
<jsp:forward page="account_settings.jsp" >
  <jsp:param name="message" value="Name field can not be left blank" />
  <jsp:param name="type" value="error"/>
</jsp:forward><%
}
else if(name.indexOf(34)!=-1||name.indexOf(39)!=-1) {
    %>
    
<jsp:forward page="account_settings.jsp" >
  <jsp:param name="message" value="Name should not contain single or double quotes" />
  <jsp:param name="type" value="error"/>
</jsp:forward>
    <%
}
    //out.println(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");   
Connection conn=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select * from accounts where uname='"+name+"' and uname!='"+session.getAttribute("username")+"'";
ResultSet rs = stmt.executeQuery(query);
rs.next();
if(rs.getRow()==1)
       {
    rs.close();
    conn.close();%>
<jsp:forward page="account_settings.jsp" >
  <jsp:param name="message" value="User name already exist" />
  <jsp:param name="type" value="error"/>
</jsp:forward><%
       }
try{
query="update accounts set uname='"+name+"' where uname='"+session.getAttribute("username")+"'";
session.setAttribute("username",name);
stmt.executeUpdate(query);
conn.close();%>
<jsp:forward page="account_settings.jsp" >
  <jsp:param name="message" value="User name updated Successfully" />
  <jsp:param name="type" value="success"/>
</jsp:forward>
<%
}catch(Exception e)
{
out.println(e.toString());
}
    %>

</html>
