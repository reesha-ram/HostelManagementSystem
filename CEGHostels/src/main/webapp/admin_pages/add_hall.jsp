<%-- 
    Document   : admin_add_hall
    Created on : 4 Nov, 2012, 8:59:28 PM
    Author     : niyasc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<center><div class="heading">Enter Hall Information</div>
<%    if(request.getParameter("message")!=null){
        out.println("<div class=warning>"+request.getParameter("message")+"</div>");
    }
       else{
       out.println("</br>");
        
       }
    
    
       %>
    <form method="POST" action="insert_hall.jsp">
    <table>
        <tr>
            <td style="text-align: center">Name of Hall</td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="text"  name="name" required/></td>
        </tr>
        <tr>
            <td style="text-align: center">Name of Provost</td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="text"  name="provost" required/></td>
        </tr>
        <tr>
            <td style="text-align: center"><input type="submit" value="Add Hall"/></td>
        </tr>

    </table>
    </form>
    
</center>
</html>
