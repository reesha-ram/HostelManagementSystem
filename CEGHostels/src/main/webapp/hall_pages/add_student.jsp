

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
    

<form action="insert_student.jsp" method="POST">
<table style="margin-left: auto;margin-right: auto">
    <tr>
        <td>Student ID</td>
        <td><input type="text" name="id" required/></td>
    </tr>
    <tr>
        <td>Student Name</td>
        <td><input type="text" name="name" required/></td>
    </tr>
    <tr>
        <td>Course</td>
        <td><input type="text" name="course" required=""/></td>
    </tr>
    <tr>
        <td>Department</td>
        <td><input type="text" name="dept" required=""/></td>
    </tr>
    <tr>
    <td>City</td>
    <td><input type="text" name="city" required=""/></td>
    </tr>
    <tr>
        <td>State</td>
        <td><input type="text" name="state" required></td>
    </tr>
    <tr>
        <td>Phone</td>
        <td><input type="text" name="phone" required></td>
    </tr>
    <tr>
        <td>Year</td>
        <td><input type="text" name="year" required=""></td>
    </tr>
     <tr>
        <td>Fees</td>
        <td><input type="text" name="fees" ></td>
    </tr>
     <tr>
        <td>Feepay_Start_date</td>
        <td><input type="text" name="start" ></td>
    </tr>
     <tr>
        <td>Feepay_due_date</td>
        <td><input type="text" name="due" ></td>
    </tr>
    <tr>
	<td>Hostel</td>
<%

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select name from Hostel where hid in (select hostel_id from hostel_hall where hall_id="
	+session.getAttribute("h_no")+")";
ResultSet rs=stmt.executeQuery(query);
out.println("<td><select name='hostel'");
out.println("<option selected>None</option>");
while(rs.next()){
    out.println("<option>"+rs.getString("name")+"</option>");
}
out.println("</select></td>");

rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
</tr>
</table>
<input type="submit" value="Add record">
</form>
</html>
