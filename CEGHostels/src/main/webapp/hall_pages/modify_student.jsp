<%-- 
    Document   : modify_student
    Created on : Nov 10, 2012, 7:39:58 PM
    Author     : niyasc
--%>

<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
    public int invalid(String s){
        if(s.contains("'")||s.contains("\"")){
            return 1;
        }
               else{
            return 0;
               }
            
    }
    %>
    <%
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String course=request.getParameter("course");
    String dept=request.getParameter("dept");
    String city=request.getParameter("city");
    String state=request.getParameter("state");
    String phone=request.getParameter("phone");
    String year=request.getParameter("year");
    String hostel=request.getParameter("hostel");
    String fees=request.getParameter("fees");
    String start=request.getParameter("start");
    String due=request.getParameter("due");
   
    //out.println(id+name+course+dept+city+state+year+Hostel);
    if(invalid(name)==1||invalid(course)==1||invalid(dept)==1||invalid(city)==1||invalid(state)==1){
        %>
        <jsp:forward page="edit_student.jsp" >
        <jsp:param name="message" value="Enter valid inputs" />
        </jsp:forward>
        <%
    }
       else if(!(id.matches("[0-9]+")&&year.matches("[0-9]+"))){
           %>
           <jsp:forward page="edit_student.jsp" >
           <jsp:param name="message" value="Invalid Numeric entry" />
           </jsp:forward><%
       }
    
try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="Update Student set name='"+name+"' where sid="+id;
stmt.executeUpdate(query);
query="Update Student set course='"+course+"' where sid="+id;
stmt.executeUpdate(query);
query="Update Student set dept='"+dept+"' where sid="+id;
stmt.executeUpdate(query);
query="Update Student set city='"+city+"' where sid="+id;
stmt.executeUpdate(query);
query="Update Student set state='"+state+"' where sid="+id;
stmt.executeUpdate(query);
query="Update Student set year="+year+" where sid="+id;
stmt.executeUpdate(query);
query="Update Student set phone="+phone+" where sid="+id;
stmt.executeUpdate(query);
query="Update Student set fees='"+fees+"' where sid="+id;
stmt.executeUpdate(query);
query="Update Student set start_date='"+start+"' where sid="+id;
stmt.executeUpdate(query);
query="Update Student set end_date='"+due+"' where sid="+id;
stmt.executeUpdate(query);
query="Update student_hostel set hostel_id=(select hid from Hostel where name='"
        +hostel+"') where student_id="+id;

conn.close();
%>
           <jsp:forward page="student_info.jsp" >
           <jsp:param name="message" value="Student updated successfully" />
           <jsp:param name="type" value="success"/>
           </jsp:forward><%

}catch(Exception e)
{
out.println(e.toString());
}
    %>

</html>
