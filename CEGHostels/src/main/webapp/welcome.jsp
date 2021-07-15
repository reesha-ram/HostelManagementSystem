
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
int id1=Integer.parseInt(request.getParameter("txt_id"));
String query="select * from Student where sid = "+id1+" ";
ResultSet rs = stmt.executeQuery(query);
rs.next();
%>
<h3 style="text-align: center">Student Information</h3>
<table style="margin-left: auto;margin-right: auto">
    <tr>
        <td>
            Student ID
        </td>
    <%out.println("<td><input type=text value='"+rs.getInt("a.sid")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Name
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.name")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Course
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.course")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Department
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.dept")+"' readonly/></tr></td>");%>
    
    <tr>
        <td>
            Year
        </td>
    <%out.println("<td><input type=text value='"+rs.getInt("a.year")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            City
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.city")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            State
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("a.state")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Phone
        </td>
    <%out.println("<td><input type=text value='"+rs.getInt("a.phone")+"' readonly/></tr></td>");%>
    <tr>
        <td>
            Room Number
        </td>
    <%out.println("<td><input type=text value='"+rs.getString("b.room_no")+"' readonly/></tr></td>");%>
        <tr>
        <td>
            Hostel
        </td>
    <%
    out.println("<td><input type=text value='"+rs.getString("c.name")+"' readonly/></tr></td>");
%>
    
    
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

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Welcome : <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">

</head>

<body>


    <div class="main-content">
	
	<center>
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("studentindex.jsp"); 
	}
	%>

	<h2><a href="logouts.jsp">Logout</a></h2>
    
	</center>
		
    </div>

</body>

</html>
