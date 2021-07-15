
<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>


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
    String year=request.getParameter("year");
    String hostel=request.getParameter("hostel");
    String phone=request.getParameter("phone");
    String fees=request.getParameter("fees");
    String start=request.getParameter("start");
    String due=request.getParameter("due");
   
   
   
    
  
   
    
    if(invalid(name)==1||invalid(course)==1||invalid(dept)==1||invalid(city)==1||invalid(state)==1){
        %>
        <jsp:forward page="add_student.jsp" >
        <jsp:param name="message" value="Enter valid inputs" />
        </jsp:forward>
        <%
    }
       else if(!(id.matches("[0-9]+")&&year.matches("[0-9]+"))){
           %>
           <jsp:forward page="add_student.jsp" >
           <jsp:param name="message" value="Invalid Numeric entry" />
           </jsp:forward><%
       }

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select count(*) from Student where sid="+id;
ResultSet rs=stmt.executeQuery(query);
rs.next();
if(rs.getInt(1)!=0){%>
    <jsp:forward page="add_student.jsp" >
           <jsp:param name="message" value="ID already exists." />
           <jsp:param name="type" value="success"/>
           </jsp:forward><%
}
query="insert into Student(sid,name,course,dept,year,city,state,phone,fees,start_date,end_date) values("+id+",'"+name+"','"
	+course+"','"+dept+"',"+year+",'"+city+"','"+state+"',"+phone+",'"+fees+"','"+start+"','"+due+"')";

stmt.executeUpdate(query);
query="select hid from Hostel where name='"+hostel+"'";
rs=stmt.executeQuery(query);
rs.next();
int hid=rs.getInt("hid");
query="insert into student_hostel(student_id,hostel_id) values("+id+","+hid+")";
stmt.executeUpdate(query);

conn.close();
%>
           <jsp:forward page="student_info.jsp" >
           <jsp:param name="message" value="Student inserted successfully" />
           <jsp:param name="type" value="success"/>
           </jsp:forward><%

}catch(Exception e)
{
out.println(e.toString());
}
    %>

</html>
