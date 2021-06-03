<%-- 
    Document   : hall_info
    Created on : 6 Nov, 2012, 11:45:48 PM
    Author     : niyasc
--%>

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
String query="select a.sid,a.name,a.course,a.dept,a.year,a.city,a.state,a.phone,b.room_no,"
 + "c.name from Student a,student_hostel b,Hostel c where b.student_id=a.sid "
 + "and c.hid=(select hostel_id from student_hostel where student_id=a.sid)";
ResultSet rs = stmt.executeQuery(query);
%>
<table class="table_style">
    <tr>
    <td>Student ID</td>
    <td>Name</td>
    <td>Course</td>
    <td>Department</td>
    <td>Year</td>
    <td>City</td>
    <td>State</td>
    <td>Phone</td>
    <td>Room No.</td>
    <td>Hostel</td>
    <td></td>
    </tr>
    <%
    int i=0;
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        out.println("<td>"+rs.getString("a.name")+"</td>");
        out.println("<td>"+rs.getString("a.course")+"</td>");
        out.println("<td>"+rs.getString("a.dept")+"</td>");
        out.println("<td>"+rs.getInt(5)+"</td>");
        out.println("<td>"+rs.getString("a.city")+"</td>");
        out.println("<td>"+rs.getString("a.state")+"</td>");
        out.println("<td>"+rs.getInt(8)+"</td>");
        out.println("<td>"+rs.getInt(9)+"</td>");
        out.println("<td>"+rs.getString("c.name")+"</td>");
        out.println("<form action='view_student.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("a.sid")+"' name='id'/>");
        out.println("<td><input type='submit' value='View'/>");
        out.println("</form>");
        //out.println("<td>"+rs.getInt(3)+"</td>");
        //out.println("<td>"+rs.getInt(5)+"</td>");
        //out.println("<td>"+rs.getInt(4)+"</td>");
        //out.println("<td>"+rs.getString("a.mess_contractor")+"</td>");
        
        //out.println("<td>"+rs.getInt(7)+"</td>");
        //out.println("<td>"+rs.getString("b.name")+"</td>");
        out.println("</tr>");
        i=i+1;
               }
    if(i==0){
        %>
        <tr>
            <td>No records found.</td>
        </tr>
        <%
}
out.println("<br/>");
%>
</table>
<%
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>

</html>
