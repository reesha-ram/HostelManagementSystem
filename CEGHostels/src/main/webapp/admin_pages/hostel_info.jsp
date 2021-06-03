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
String query="select a.hid,a.name,a.capacity,a.no_of_rooms,a.mess_contractor,"
 + "a.mess_capacity,b.name,a.care_taker from Hostel a,Hall b where b.hid in(select Hall_id from hostel_hall"
 + " where Hostel_id=a.hid)";
ResultSet rs = stmt.executeQuery(query);
%>
<table class="table_style">
    <tr>
    <td>Hostel ID</td>
    <td>Name</td>
    <td>Care taker</td>
    <td>Capacity</td>
    <td>Number of Rooms</td>
    <td>Mess Contractor</td>
    <td>Mess Capacity</td>
    <td>Hall Name</td>
    <td></td>
    </tr>
    <%
    int i=0;
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        out.println("<td>"+rs.getString("a.name")+"</td>");
        out.println("<td>"+rs.getString("a.care_taker")+"</td>");
        out.println("<td>"+rs.getInt(3)+"</td>");
        out.println("<td>"+rs.getInt(4)+"</td>");
        out.println("<td>"+rs.getString("a.mess_contractor")+"</td>");
        
        out.println("<td>"+rs.getInt(6)+"</td>");
        out.println("<td>"+rs.getString("b.name")+"</td>");
        
        out.println("<form action='view_hostel.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("a.hid")+"' name='id'/>");
        out.println("<td><input type='submit' value='View'></td>");
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
