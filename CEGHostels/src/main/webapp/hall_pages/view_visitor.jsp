<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<%
String student_name=request.getParameter("student_name");
String visitor_name=request.getParameter("visitor_name");
String id=request.getParameter("id");
String hostel=request.getParameter("hostel");
String entry_time=request.getParameter("entry_time");
String exit_time=request.getParameter("exit_time");
%>
<table>
    <%
    out.println("<tr>");
    out.println("<td>Visitor Name</td>");
    out.println("<td><input type=text readonly value='"+visitor_name+"'></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td>Student visited</td>");
    out.println("<td><input type=text readonly value='"+student_name+"'></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td>Hostel</td>");
    out.println("<td><input type=text readonly value='"+hostel+"'></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td>Entry time</td>");
    out.println("<td><input type=text readonly value='"+entry_time+"'></td>");
    out.println("</tr>");
    out.println("<tr>");
    out.println("<td>Exit time</td>");
    out.println("<td><input type=text readonly value='"+exit_time+"'></td>");
    out.println("</tr>");
    %>
</table>
<form action="visitor_info.jsp">
    <input type="submit" value="GoBack">
</form>