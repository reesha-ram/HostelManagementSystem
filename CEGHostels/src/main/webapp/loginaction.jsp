<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Checking Login</title>
</head>
<body>
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
rs.next();
//out.println(rs.getRow());
if(rs.getRow()==1)
{
    request.getSession();
    out.println("new session created");
    session.setAttribute("username",rs.getString(1));
    session.setAttribute("level", rs.getInt(3));
    session.setAttribute("h_no", rs.getInt(4));
    if(rs.getInt(3)==0){
    %>
    <%--@ include file="admin.jsp" --%>
    <%response.sendRedirect("admin.jsp");%>
    <%}
       else if(rs.getInt(3)==1){
    %>
    <%--@ include file="hall.jsp" --%>
    <%response.sendRedirect("hall.jsp");%>
    <%}
    else{
    %>
    <%--@ include file="hostel.jsp" --%>
    <%response.sendRedirect("hostel.jsp");%>
    <%}
    
}
    
else
{
    response.sendRedirect("index.jsp?status=2");
}
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
</body>
</html>