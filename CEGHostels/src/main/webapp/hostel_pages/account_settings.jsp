<%-- 
    Document   : account_settings
    Created on : 7 Nov, 2012, 11:06:37 PM
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
<table style="text-align: center">
        <form method="POST" action="change_username.jsp">
        <tr>
            <td><strong>User Name</strong></td>
        </tr>
        <tr>
            <%
            out.println("<td><input type=text value='"+session.getAttribute("username")+"' name='uname'/></td>");
            %>
        </tr>
        <tr>
            <td><input type="submit" value="Change Username" required=""></td>
        </tr>
        </form>
        <form method="POST" action="change_password.jsp">
        <tr>
            <td><strong>Password</strong></td>
        </tr>
        <tr>
            <td><input type="password" name="password1" required=""></td>
        </tr>
        <tr>
            <td><strong>Confirm Password</strong></td>
        </tr>
        <tr>
            <td><input type="password" name="password2" required=""></td>
        </tr>
        <tr>
            <td><input type="submit" value="Change Password"></td>
        </tr>
        </form>
    </table>
</html>
