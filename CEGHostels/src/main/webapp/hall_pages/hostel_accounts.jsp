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
       out.println("</br>");
        
       }
   %>
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
//a.h_no=b.hid and a.type=2 and b.hid in(select Hostel_id from hostel_hall where Hall_id=5);
String query="select a.uname,b.name from accounts a,Hostel b where a.type=2 and "
 + "a.h_no=b.hid and b.hid in(select Hostel_id from hostel_hall where Hall_id="+
 session.getAttribute("h_no")+")";
ResultSet rs = stmt.executeQuery(query);
%>
<table class="table_style">
    <tr>
    <td>UserName</td>
    <td>Hall</td>
    <td></td>
    <td></td>
    </tr>
    <%
    int i=0;
    while(rs.next()){
        

        out.println("<tr>");
        out.println("<td>"+rs.getString("a.uname")+"</td>");
        out.println("<td>"+rs.getString("b.name")+"</td>");
/*        out.println("<form method='POST' action='password_reset.jsp'>");
        out.println("<td style='white-space : nowrap;'><input type='submit' value='Reset Password'/>");
        out.println("</form>");
        out.println("<form method='POST' action='delete_account.jsp'>");
        out.println("<input type='submit' value='Delete Account'/></td>");
        out.println("</form>");*/
        %>
        <form method="POST" action='password_reset.jsp'>
            <td><%
                out.println("<input type='hidden' value='"+rs.getString("a.uname")+"' name='uname'/>");
                %>
                <input type="submit" value="Reset Password">
            </td>
        </form>
        <form method="POST" action="delete_account.jsp">
        <td>
            <input type="submit" value="Delete Account"/>
            <%
                out.println("<input type='hidden' value='"+rs.getString("a.uname")+"' name='uname'/>");
                %>
        </td>
        </form>
        <%

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
  <form action="create_account.jsp">
      <input type="submit" value="Create Account" style=" font-size: 24px;font-family: Arial"/>
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
