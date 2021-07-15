<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<head>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
                                          
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String uname=request.getParameter("username");
String passwd=request.getParameter("password");
//Get Hall name
String query="select name from Hall where hid="+session.getAttribute("h_no");
ResultSet rs = stmt.executeQuery(query);
rs.next();
String hall=rs.getString("name");
//Number of Hostels
query="select count(*) from Hostel where hid in "
 + "(select Hostel_id from hostel_hall where Hall_id="+session.getAttribute("h_no")+")";
rs=stmt.executeQuery(query);
rs.next();
int hostel=rs.getInt(1);
//Number of students Admitted
query="select count(*) from Student where sid in"
 + "(select student_id from student_hostel where hostel_id in"
 + "(select Hostel_id from hostel_hall where Hall_id="+session.getAttribute("h_no")+"))";
rs=stmt.executeQuery(query);
rs.next();
int student=rs.getInt(1);
rs.close();
query="select * from Hall where hid="+session.getAttribute("h_no");
ResultSet hall_info=stmt.executeQuery(query);
hall_info.next();
String provost=hall_info.getString("provost");
hall_info.close();
%>
<br/>
<table class="table_style">
    <tr>
        <td><%=hall%> Overview</td><td></td>
    </tr>
    <tr>
        <td>Number of Hostels</td>
        <td><%=hostel%></td>
    </tr>
    <tr>
        <td>Number of Students</td>
        <td><%=student%></td>
    </tr>
    <tr>
        <td>Provost</td>
        <td><%=provost%> </td>
    </tr>
</table>
<%
    conn.close();
}
catch(Exception e)
{
out.println(e.toString());
}%>

