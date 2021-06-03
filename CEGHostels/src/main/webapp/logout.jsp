<%-- 
    Document   : logout
    Created on : 10 Oct, 2012, 12:56:15 AM
    Author     : niyasc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <%
    if(session.getAttribute("username")==null)
    response.sendRedirect("index.jsp");	
    else
    {
    session.setAttribute("username",null);
    session.invalidate();
    out.println("Successfully logged out.\nRedirecting to login page");
    //response.wait(5);
       %><% 
    response.sendRedirect("index.jsp?status=3");
    }
    %>