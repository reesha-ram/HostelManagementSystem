
<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<HTML>
    <style>
        #result
         {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-left: auto;
   margin-bottom:10px;
    margin-top:10px;
    margin-right: auto;
}
#gpa{
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: red;
  color: white;
}
#gpa1{
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: red;
  color: white;
}
#result td, #result th
 {
  border: 1px solid #ddd;
  padding: 8px;
}

#result tr:nth-child(even){background-color:  #ffccff}

#result tr:hover {background-color: #ffccff;}

#result th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: black;
  color: white;
}
       </style>
       <BODY>
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
	int rollno=Integer.parseInt(request.getParameter("rollno"));
	session.setAttribute("sid", rollno);
Statement stmt = conn.createStatement();
String query="select a.sid,a.name,a.course,a.dept,a.year,a.city,a.state,a.phone,a.fees,a.start_date,a.end_date,b.room_no,"
 + "c.name from Student a,student_hostel b,Hostel c where b.student_id=a.sid "
 + "and c.hid=(select hostel_id from student_hostel where student_id=a.sid) and a.sid="+Integer.parseInt(request.getParameter("rollno"));
ResultSet rs = stmt.executeQuery(query);
rs.next();
%>
<h3 style="text-align: center">Student Information</h3>
<table id="result">
    <tr id="gpa">
        <td>
            Student ID
        </td>
    <%out.println("<td>"+rs.getInt("a.sid")+"</td>");%>
    </tr>
    <tr>
        <td>
            Name
        </td>
    <%out.println("<td>"+rs.getString("a.name")+"</td>");%>
    </tr>
    <tr>
        <td>
            Course
        </td>
    <%out.println("<td>"+rs.getString("a.course")+"</td>");%>
    </tr>
    <tr>
        <td>
            Department
        </td>
    <%out.println("<td>"+rs.getString("a.dept")+"</td>");%>
    
    <tr>
        <td>
            Year
        </td>
    <%out.println("<td>"+rs.getInt("a.year")+"</td>");%>
    <tr>
        <td>
            City
        </td>
    <%out.println("<td>"+rs.getString("a.city")+"</td>");%>
    <tr>
        <td>
            State
        </td>
    <%out.println("<td>"+rs.getString("a.state")+"</td>");%>
    <tr>
        <td>
            Phone
        </td>
    <%out.println("<td>"+rs.getInt("a.phone")+"</td>");%>
    <tr>
        <td>
            Fees
        </td>
    <%out.println("<td>"+rs.getString("a.fees")+"</td>");%>
    <tr>
        <td>
            Start_date
        </td>
    <%out.println("<td>"+rs.getString("a.start_date")+"</td>");%>
    <tr id ="gpa1">
        <td id ="gpa1">
            Due_date
        </td>
    <%out.println("<td>"+rs.getString("a.end_date")+"</td>");%>
    <tr>
        <td>
            Room Number
        </td>
    <%out.println("<td>"+rs.getString("b.room_no")+"</td>");%>
        <tr>
        <td>
            Hostel
        </td>
    <%
    out.println("<td>"+rs.getString("c.name")+"</td>");
%>
   
</table>
<center>
<form action="slogout.jsp" method="post">
 <input type="submit" value="logout"> 
 </center>    


<%
out.println("<br/>");
rs.close();
conn.close();
}catch(Exception e)
{
out.println(e.toString());
}
%>