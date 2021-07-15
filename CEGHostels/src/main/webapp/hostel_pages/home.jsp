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
//Get Hostel name
String query="select name from Hostel where hid="+session.getAttribute("h_no");
ResultSet rs = stmt.executeQuery(query);
rs.next();
String hostel=rs.getString("name");
//Number of Students
query="select count(*) from Student where sid in "
 + "(select student_id from student_hostel where hostel_id="+session.getAttribute("h_no")+")";
rs=stmt.executeQuery(query);
rs.next();
int student=rs.getInt(1);
rs.close();
query="select * from Hostel where hid="+session.getAttribute("h_no");
ResultSet hall_info=stmt.executeQuery(query);
hall_info.next();
String care_taker=hall_info.getString("care_taker");
//hall_info.close();
%>
<br/>
<table class="table_style">
    <tr>
        <td><%=hostel%> Overview</td><td></td>
    </tr>
    <tr>
	<td>Accomodation facility</td>
	<td><%=hall_info.getInt("capacity")%></td>
    </tr>
    <tr>
	<td>Number of rooms</td>
	<td><%=hall_info.getInt("no_of_rooms")%></td>
    </tr>
    <tr>
        <td>Number of Students</td>
        <td><%=student%></td>
    </tr>
    <tr>
        <td>Care Taker</td>
        <td><%=care_taker%> </td>
    </tr>
    
</table>
<%
    hall_info.close();
    conn.close();
}
catch(Exception e)
{
out.println(e.toString());
}%>

