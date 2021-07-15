
<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <form action="signup_visitor.jsp">
	<table>
	    <tr>
		<td>Student Name</td>
		<%
		
                try{
                	Class.forName("com.mysql.cj.jdbc.Driver");   
                	Connection conn=DriverManager.getConnection(  
                	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
                   Statement stmt = conn.createStatement();
                   String query="select name from Student where sid in"
 + "(select student_id from student_hostel where hostel_id="+session.getAttribute("h_no")+")";
		   ResultSet rs=stmt.executeQuery(query);
		%><td><select name='student_name'><%
		   while(rs.next()){
		       out.println("<option>"+rs.getString("name")+"</option>");
		   }
		   out.println("</select></td>");
	           }
		catch(Exception e){
                     out.println(e.toString());
                   }
%>
		
	    </tr>
	    <tr>
		<td>
		    Visitor Name
		</td>
		<td>
		    <input type="text" name="visitor_name" required="" />
		</td>
	    </tr>
	</table>
<input type="submit" value="Signup Visitor" />
    </form>
</html>
