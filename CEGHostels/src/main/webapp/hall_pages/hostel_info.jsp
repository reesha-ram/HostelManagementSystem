
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
String query="select hid,name,capacity,no_of_rooms,mess_contractor,"
 + "mess_capacity,name,care_taker from Hostel where hid in "
 + "(select Hostel_id from hostel_hall where Hall_id="+session.getAttribute("h_no")+")";
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
    <td></td>
    <td></td>
    </tr>
    <%
    int i=0;
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        out.println("<td>"+rs.getString("name")+"</td>");
        out.println("<td>"+rs.getString("care_taker")+"</td>");
        out.println("<td>"+rs.getInt(3)+"</td>");
        out.println("<td>"+rs.getInt(4)+"</td>");
        out.println("<td>"+rs.getString("mess_contractor")+"</td>");
        
        out.println("<td>"+rs.getInt(6)+"</td>");
        
        out.println("<form action='edit_hostel.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("hid")+"' name='id'/>");
        out.println("<td><input type='submit' value='Edit'></td>");
        out.println("</form>");
        out.println("<form action='delete_hostel.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt("hid")+"' name='id'/>");
        out.println("<td><input type='submit' value='Delete'></td>");
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
<form action="add_hostel.jsp"/>
<input type="submit" value="Create Hostel" style=" font-size: 24px;font-family: Arial">
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
