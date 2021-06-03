<%-- 
    Document   : add_hostel
    Created on : Nov 10, 2012, 2:23:48 PM
    Author     : niyasc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
    </head>
    
<form action="insert_hostel.jsp">
    <h3 style="text-align: center">Enter Hoste Info<br/></h3>
    <%
if(request.getParameter("message")!=null){
    out.println("<div class='warning' >"+request.getParameter("message")+"</div>");
}
else{
    out.println("</br>");
}
%>
<table style="margin-left: auto;margin-right: auto">
    <tr>
        <td>Hostel Name</td>
        <td><input type="text" name="name" required=""></td>
    </tr>
    <tr>
        <td>Care taker</td>
        <td><input type="text" name="care_taker" ></td>
    </tr>
    <tr>
        <td>Number of Rooms</td>
        <td><input type="text" name="no_of_rooms" required=""></td>
    </tr>
    <tr>
        <td>Accomodation facility</td>
        <td><input type="text" name="capacity" required=""></td>
    </tr>
    <tr>
        <td>Mess capacity</td>
        <td><input type="text" name="mess_capacity" required=""></td>
    </tr>
    <tr>
        <td>Mess contractor</td>
        <td><input type="text" name="mess_contractor" required=""></td>
    </tr>
    <tr>
        <td style="text-align: center"><input type="submit" value="Create"/></td>
    </tr>
</table>
</form>
</html>
