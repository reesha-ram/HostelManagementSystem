
<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
          <%
   if(request.getParameter("message")!=null){
       out.println("<div class='warning'>"+request.getParameter("message")+"</div>");
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
 + "and c.hid=(select hostel_id from student_hostel where student_id=a.sid) and a.sid = "
 +request.getParameter("id");
ResultSet rs = stmt.executeQuery(query);
rs.next();
%>
<form action="modify_student.jsp" method="POST">
<table style="margin-left: auto;margin-right: auto">
    <%
        out.println("<tr>");
        out.println("<td>Stduent ID</td>");
        out.println("<td><input type=text value='"+rs.getInt("a.sid")+"' readonly name='id'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Stduent Name</td>");
        out.println("<td><input type=text value='"+rs.getString("a.name")+"' name='name'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Course</td>");
        out.println("<td><input type=text value='"+rs.getString("a.course")+"' name='course'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Department</td>");
        out.println("<td><input type=text value='"+rs.getString("a.dept")+"' name='dept'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>City</td>");
        out.println("<td><input type=text value='"+rs.getString("a.city")+"' name='city'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>State</td>");
        out.println("<td><input type=text value='"+rs.getString("a.state")+"' name='state'></td>");
        out.println("</tr>");
	out.println("<tr>");
        out.println("<td>Phone</td>");
        out.println("<td><input type=text value='"+rs.getInt("a.phone")+"' name='phone'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Year</td>");
        out.println("<td><input type=text value='"+rs.getInt("a.year")+"' name='year'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Fees</td>");
        out.println("<td><input type=text value='"+rs.getString("a.fees")+"' name='fees'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Feepay_start_date</td>");
        out.println("<td><input type=text value='"+rs.getString("a.start_date")+"' name='start'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Feepay_end_date</td>");
        out.println("<td><input type=text value='"+rs.getString("a.end_date")+"' name='due'></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Room Number</td>");
        out.println("<td><input type=text value='"+rs.getInt("b.room_no")+"' name='room_no' readonly></td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Hostel</td>");
        String hostel=rs.getString("c.name");
        //out.println("<td><input type=text value="+rs.getString("c.name")+" readonly></td>");
        //out.println("</tr>");
        query="select name from Hostel where hid in "
 + "(select Hostel_id from hostel_hall where Hall_id="+session.getAttribute("h_no")+")";
        rs=stmt.executeQuery(query);
        out.println("<td><select name='hostel'>");
        while(rs.next()){
            if(rs.getString("name").equals(hostel)){
                out.println("<option selected>"+rs.getString("name")+"</option>");
            }
                       else{
                out.println("<option>"+rs.getString("name")+"</option>");
                       }
        }
        out.println("</select></td>");
        %>
</table>
<input style="" type="submit" value="Update"/>
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
