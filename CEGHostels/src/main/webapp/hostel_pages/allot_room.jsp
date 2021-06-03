<%-- 
    Document   : allot_room
    Created on : Nov 11, 2012, 11:34:26 AM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
    <%
    String change=request.getParameter("change");
    String id=request.getParameter("id"); 
  
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");   
    	Connection conn=DriverManager.getConnection(  
    	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
	Statement stmt = conn.createStatement();
	
    
	String query="select a.name ,b.room_no from Student a,student_hostel b where  b.student_id="
		+id+" and a.sid="+id;
	ResultSet rs=stmt.executeQuery(query);
	rs.next();
	String name=rs.getString("a.name");
	int room_no=rs.getInt("b.room_no");
	%>
	  <% if(request.getParameter("message")!=null){
       out.println("<div class='warning'>"+request.getParameter("message")+"</div>");
    }
       else{
       out.println("<br/>");
        
       }%>
	<form action="modify_room.jsp" method="POST">
	<table>
	    <tr>
		<td>Name</td>
		<%
		out.println("<input type=hidden value="+id+" name='id'>");
		out.println("<input type=hidden value=1 name='change'>");
		out.println("<td><input type=text value='"+name+"' readonly></td>");
		%>
	    </tr>
	    <tr>
		<td>Room Number</td>
		<%
		out.println("<td><input type=text value="+room_no+" name=room_no required></td>");
		%>
	    </tr>
	</table>
	    <input type="submit" value="Allot/Change Room"/>
	</form>
	<%
}catch(Exception e)
{
out.println(e.toString());
}
    %>
</html>
