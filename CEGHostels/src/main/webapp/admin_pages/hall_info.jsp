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
String query="select * from Hall";
ResultSet rs = stmt.executeQuery(query);
%>
<table class="table_style">
    <tr>
    <td>Hall ID</td>
    <td>Name</td>
    <td>Provost</td>
    <td>Number of Hostels</td>
    <td></td>
    <td></td>
    </tr>
    <%
    int i=0;
    while(rs.next()){
        

        out.println("<tr>");
        out.println("<td>"+rs.getInt(1)+"</td>");
        //out.println("<td>"+rs.getString("name")+"</td>");
        out.println("<form method='POST' action='edit_hall.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt(1)+"' name='id'/>");
        out.println("<td>"+rs.getString("name")+"</td>");
        %>
        
        <%
        out.println("<td>"+rs.getString("provost")+"</td>");
        out.println("<td>"+rs.getInt(3)+"</td>");
        
        out.println("<td><input type='submit' value='Edit'/></td>");
        out.println("</form>");
        out.println("<form method='POST' action='delete_hall.jsp'>");
        out.println("<input type='hidden' value='"+rs.getInt(1)+"' name='id'/>");
        out.println("<td><input type='submit' value='Delete'/></td>");
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
    <form action="add_hall.jsp">
      <input type="submit" value="Add Hall" style=" font-size: 24px;font-family: Arial"/>
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
