<%-- 
    Document   : admin_add_hall
    Created on : 4 Nov, 2012, 8:59:28 PM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<center><div class="heading">Enter Account Information</div>
<%    if(request.getParameter("message")!=null){
        out.println("<div class=warning>"+request.getParameter("message")+"</div>");
    }
       else{
       out.println("</br>");
        
       }
    
    
       %>
    <form method="POST" action="insert_account.jsp">
    <table>
        <tr>
            <td style="text-align: center">User Name</td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="text"  name="name" required/></td>
        </tr>
        <tr>
            <td style="text-align: center">Password</td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="password"  name="password1" required/></td>
        </tr>
        <tr>
            <td style="text-align: center">Confirm Password</td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="password"  name="password2" required/></td>
        </tr>
        <tr>
            <td style="text-align: center">Select Hall</td>
        </tr>
        <tr><td style="text-align: center">
            <%

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select hid,name from Hall";
ResultSet rs = stmt.executeQuery(query);
out.println("<select name='hall'>");
out.println("<option>None</option>");
while(rs.next())
       {
    out.println("<option>"+rs.getString("name")+"</option>");
       }
out.println("</select>");
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
         
             %></td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="submit" value="Create Account"/></td>
        </tr>

    </table>
    </form>
    
</center>
</html>
