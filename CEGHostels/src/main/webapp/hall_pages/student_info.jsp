
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
String query="select a.sid,a.name,a.course,a.dept,a.year,a.city,a.state,a.phone,a.fees,a.start_date,a.end_date,b.room_no,"
 + "c.name from Student a,student_hostel b,Hostel c where b.student_id=a.sid "
 + "and c.hid=(select hostel_id from student_hostel where student_id=a.sid) and a.sid in"
 + "(select student_id from student_hostel where hostel_id in"
 + "(select Hostel_id from hostel_hall where Hall_id="+session.getAttribute("h_no")+"))";
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
    <td>Fees</td>
    <td>Feepay_startdate</td>
    <td>Feepay_duedate</td>
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
        out.println("<td>"+rs.getInt(12)+"</td>");
        out.println("<td>"+rs.getString("c.name")+"</td>");
        out.println("<td>"+rs.getString("a.fees")+"</td>");
        out.println("<td>"+rs.getString("a.start_date")+"</td>");
        out.println("<td>"+rs.getString("a.end_date")+"</td>");
        out.println("<form action='edit_student.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("a.sid")+"' name='id'/>");
        out.println("<td><input type='submit' value='Edit'/>");
        out.println("</form>");
        out.println("<form action='delete_student.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("a.sid")+"' name='id'/>");
        out.println("<td><input type='submit' value='Delete'/>");
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
%>
</table>
<form action="add_student.jsp" method="POST">
    <input type="submit" value="Add Student" style=" font-size: 24px;font-family: Arial">
</form>
<%
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>

</html>
