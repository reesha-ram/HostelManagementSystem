
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
       out.println("<br/>");
        
       }
   %>
    
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select a.sid,a.name,a.entry_time,a.exit_time,b.name,c.name from Visitors a,Student b,Hostel c where "
 + "a.sid=b.sid and a.sid in (select student_id from student_hostel where hostel_id in"
 + "(select Hostel_id from hostel_hall where Hall_id="+session.getAttribute("h_no")+")) and c.hid in"
 + "(select hostel_id from student_hostel where student_id=b.sid)";
ResultSet rs = stmt.executeQuery(query);
%>
<table class="table_style">
    <tr>
    <td>Student ID</td>
    <td>Student Name</td>
    <td>Hostel Name</td>
    <td>Visitor Name</td>
    <td>Entry Time</td>
    <td>Exit Time</td>
    <td></td>
    </tr>
    <%
    int i=0;
    while(rs.next()){
        out.println("<tr>");
        out.println("<td>"+rs.getInt("a.sid")+"</td>");
        out.println("<td>"+rs.getString("b.name")+"</td>");
        out.println("<td>"+rs.getString("c.name")+"</td>");
        out.println("<td>"+rs.getString("a.name")+"</td>");
        
        out.println("<td>"+rs.getString("a.entry_time")+"</td>");
	out.println("<form action='view_visitor.jsp'>");
        if(rs.getString("a.exit_time")==null){
	    out.println("<td>Still Inside</td>");
	    out.println("<input type='hidden' value='Still Inside' name='exit_time'/>");
	        }
	else{
	    out.println("<td>"+rs.getString("a.exit_time")+"</td>");
	    out.println("<input type='hidden' value='"+rs.getString("a.exit_time")+"' name='exit_time'/>");
	}
        //out.println("<td>"+rs.getInt("a.exit_time")+"</td>");
        out.println("<input type='hidden' value='"+rs.getString("b.name")+"' name='student_name' />");
	out.println("<input type='hidden' value='"+rs.getString("a.name")+"' name='visitor_name' />");
        out.println("<input type='hidden' value='"+rs.getString("c.name")+"' name='hostel' />");
        out.println("<input type='hidden' value='"+rs.getInt("a.sid")+"' name='id'/>");
	out.println("<input type='hidden' value='"+rs.getString("a.entry_time")+"' name='entry_time' />");
        out.println("<td><input type='submit' value='View Visitor'/></td>");
        out.println("</form>");
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
<%
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>

</html>
