<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<%

if(request.getParameter("name")==null||request.getParameter("name").equals("")){
    %>
<jsp:forward page="add_hall.jsp" >
  <jsp:param name="message" value="Name field can not be left blank" />
</jsp:forward><%
}
else if(request.getParameter("name").indexOf(34)!=-1||request.getParameter("name").indexOf(39)!=-1) {
    %>
    
<jsp:forward page="add_hall.jsp" >
  <jsp:param name="message" value="Name should not contain single or double quotes" />
</jsp:forward>
    <%
}
try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String uname = (String)session.getAttribute("username");
String query="select * from Hall where name='"+request.getParameter("name")+"'";
ResultSet rs = stmt.executeQuery(query);
rs.next();
if(rs.getRow()==1)
       {
    rs.close();
    conn.close();%>
<jsp:forward page="add_hall.jsp" >
  <jsp:param name="message" value="Hall already exist" />
</jsp:forward><%
       }

    query="insert into Hall(name,provost,no_of_hostels) values('"+request.getParameter("name")+"','"+request.getParameter("provost")+"',0)";
    stmt.executeUpdate(query);

conn.close();
response.sendRedirect("hall_info.jsp?message=Hall+inserted+Succesfully&type=success");
}catch(Exception e)
{
out.println(e.toString());
}

%>