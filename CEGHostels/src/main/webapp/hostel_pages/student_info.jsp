
<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
          <%
   if(request.getParameter("message")!=null){
       if(request.getParameter("type").equals("error")){
        out.println("<div class=warning>"+request.getParameter("message")+"</div>");   
       }
             else if(request.getParameter("type").equals("success")){
           out.println("<div class=signoff>"+request.getParameter("message")+"</div>");
       }
        
    }
       else{
       out.println("<br/>");
        
       }
   %>
    
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select a.sid,a.name,a.course,a.dept,a.year,a.city,a.state,a.phone,b.room_no from "
 + "Student a,student_hostel b where a.sid in (select student_id from student_hostel where"
 + " hostel_id="+session.getAttribute("h_no")+") and a.sid=b.student_id";
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
    <td></td>
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
        out.println("<form action='view_student.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("a.sid")+"' name='id'/>");
        out.println("<td><input type='submit' value='View Student'/>");
        out.println("</form>");
        out.println("<form action='allot_room.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("a.sid")+"' name='id'/>");
        out.println("<td><input type='submit' value='Allot/Change Room'/>");
        out.println("</form>");
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
