<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Hostel Page</title>
</head>
<body>
    <% String block=request.getParameter("page");%>
    <%@include file="banner.jsp"%>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
    Connection conn=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String uname = (String)session.getAttribute("username");
String query="select * from accounts where uname='"+uname+"' and type=2";
ResultSet rs = stmt.executeQuery(query);
rs.next();
//out.println(rs.getRow());
if(rs.getRow()==1)
{
           %>
           <table><tr>
                   <td style="vertical-align: top">
                    <%@include file="hostel-panel.jsp"%>   
                   </td>
                   <td>
                       <%
                       if(block==null||block.equals("home")){
                               %><h2 style="text-align: center">HOME</h2><%
                               out.println("<iframe src =hostel_pages/home.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
		       	       else if (block.equals("student_info")){
			       %><h2 style="text-align: center">Student Info</h2><%
                               out.println("<iframe src =hostel_pages/student_info.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
			       }
		       else if (block.equals("visitor_book")){
			       %><h2 style="text-align: center">Visitor Book</h2><%
                               out.println("<iframe src =hostel_pages/visitor_book.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
			       }
		       else if (block.equals("account_settings")){
			       %><h2 style="text-align: center">Account Settings</h2><%
                               out.println("<iframe src =hostel_pages/account_settings.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
			       }
		       	       else{
			   out.println("Requested resource is not available or you are not supposed to access it");
			       }
		       %>
                   </td>
               </tr></table>
           <%
}
    
else if (session.getAttribute("username")!=null)
{
    out.println("Access Denied");
       }
else
       {
    response.sendRedirect("index.jsp?status=1");
}
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>
</body>
</html>