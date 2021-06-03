<%-- 
    Document   : password_reset
    Created on : 7 Nov, 2012, 7:30:02 PM
    Author     : niyasc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
      <%
   if(request.getParameter("message")!=null){
        out.println("<div class=warning>"+request.getParameter("message")+"</div>");   
       
        
    }
       else{
       out.println("</br>");
        
       }
   %>
    <form method="POST" action="reset.jsp">
    <table style="text-align: center">
        <tr>
            <td><strong>Enter New Password</strong></td>
        </tr>
        <tr>
            <td><input type="password" name="password1" required=""/></td>
        </tr>
        <tr>
            <td><strong>Confirm New Password</strong></td>
        </tr>
        <tr>
            <td><input type="password" name="password2" required=""/></td>
            <%
            out.println("<input type='hidden' value='"+request.getParameter("uname")+"' name='uname'/>");
            %>
        </tr>
        <tr>
            <td><input type="submit" value="Change Password"/><td>
        </tr>
            
        
    </table>
    </form>
</html>
