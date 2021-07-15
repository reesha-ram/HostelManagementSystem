<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<%

if(request.getParameter("name")==null||request.getParameter("name").equals("")){
    %>
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Name field can not be left blank" />
</jsp:forward><%
}
else if(request.getParameter("name").indexOf(34)!=-1||request.getParameter("name").indexOf(39)!=-1) {
    %>
    
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Name should not contain single or double quotes" />
</jsp:forward>
    <%

}
else if(request.getParameter("hall").equals("None")) {
    %>
    
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Select a Hall and try again" />
</jsp:forward>
    <%

}
else if(request.getParameter("password1").equals(request.getParameter("password2"))==false) {
    %>
    
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Passwords do not match" />
</jsp:forward>
    <%

}
try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
out.println(request.getParameter("name"));
String query="select count(*) from accounts where uname='"+request.getParameter("name")+"'";
ResultSet rs = stmt.executeQuery(query);
rs.next();

if(rs.getInt(1)==1)
{
    rs.close();
    conn.close();%>
<jsp:forward page="create_account.jsp" >
  <jsp:param name="message" value="Username already exist" />
</jsp:forward><%
}
    query="select hid from Hall where name='"+request.getParameter("hall")+"'";
    rs=stmt.executeQuery(query);
    rs.next();
    int h_no=rs.getInt(1);

    query="insert into accounts values('"+request.getParameter("name")+"','"+request.getParameter("password1")+"',1,"+h_no+")";
    stmt.executeUpdate(query);

conn.close();
response.sendRedirect("hall_accounts.jsp?message=Account+created+Succesfully&type=success");
}catch(Exception e)
{
out.println(e.toString());
}

%>