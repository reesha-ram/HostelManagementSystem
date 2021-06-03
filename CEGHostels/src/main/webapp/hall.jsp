<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Hall Page</title>
</head>
<body>
    <%
    String block=request.getParameter("page");
%>
    <%@include file="banner.jsp"%>
<% 
try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
    Connection conn=DriverManager.getConnection(  
    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String uname = (String)session.getAttribute("username");
String query="select * from accounts where uname='"+uname+"' and type=1";
ResultSet rs = stmt.executeQuery(query);
rs.next();
//out.println(rs.getRow());
if(rs.getRow()==1)
{
           %>
           <table><tr>
                   <td style="vertical-align: top;">
                    <%@include file="hall-panel.jsp"%>   
                   </td>
                   <td>
                       <%
                        if(block==null||block.equals("home")){
                                                 %><h2 style="text-align: center">HOME</h2><%
                               out.println("<iframe src =hall_pages/home.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
                        else if(block.equals("hostel_info")){
                                                 %><h2 style="text-align: center">Hostel Information</h2><%
                               out.println("<iframe src =hall_pages/hostel_info.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
                        else if(block.equals("student_info")){
                                                 %><h2 style="text-align: center">Student Information</h2><%
                               out.println("<iframe src =hall_pages/student_info.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
			else if(block.equals("hostel_accounts")){
                                                 %><h2 style="text-align: center">Hostel Accounts</h2><%
                               out.println("<iframe src =hall_pages/hostel_accounts.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
			else if(block.equals("account_settings")){
                                                 %><h2 style="text-align: center">Account Settings</h2><%
                               out.println("<iframe src =hall_pages/account_settings.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
			else if(block.equals("visitor_info")){
                                                 %><h2 style="text-align: center">Visitor Info</h2><%
                               out.println("<iframe src =hall_pages/visitor_info.jsp width=1030 height=380>");
                               out.println("<p>Your browser does not support iframes.</p>");
                               out.println("</iframe>");
                       }
                                               else{
                            out.println("Requested page is not found or you are not supported to access it.");
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