<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
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
    String name=request.getParameter("name");
    String care_taker=request.getParameter("care_taker");
    String capacity=request.getParameter("capacity");
    String no_of_rooms=request.getParameter("no_of_rooms");
    String mess_capacity=request.getParameter("mess_capacity");
    String mess_contractor=request.getParameter("mess_contractor");
    //Validate data
    if(!(capacity.matches("[0-9]+")&&no_of_rooms.matches("[0-9]+")&&mess_capacity.matches("[0-9]+"))){
        %>
        <jsp:forward page="add_hostel.jsp" >
        <jsp:param name="message" value="Enter valid inputs" />
        </jsp:forward>
        <%
    }
       else if(invalid(name)!=0||invalid(care_taker)!=0||invalid(mess_contractor)!=0){
        %>
        <jsp:forward page="add_hostel.jsp" >
        <jsp:param name="message" value="Text should not contain single and double quotes" />
        </jsp:forward>
        <%   
       }
       else{
        out.println("success");
       }
    %>
<% 

try{
	Class.forName("com.mysql.cj.jdbc.Driver");   
	Connection conn=DriverManager.getConnection(  
	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
Statement stmt = conn.createStatement();
String query="select count(*) from Hostel where name='"+name+"'";
ResultSet rs = stmt.executeQuery(query);
rs.next();
if(rs.getInt(1)!=0){
         %>
        <jsp:forward page="add_hostel.jsp" >
        <jsp:param name="message" value="Hostel Name already exists" />
        </jsp:forward>
        <% }  

query="insert into Hostel(name,capacity,no_of_rooms,care_taker,mess_capacity,mess_contractor) "
 + "values('"+name+"',"+capacity+","+no_of_rooms+",'"+care_taker+"',"+mess_capacity+",'"+mess_contractor+"')";
stmt.executeUpdate(query);
query="select hid from Hostel where name='"+name+"'";
rs=stmt.executeQuery(query);
rs.next();
int id=rs.getInt(1);
query="insert into hostel_hall values("+id+","+session.getAttribute("h_no")+")";
stmt.executeUpdate(query);
query="update Hall set no_of_hostels=no_of_hostels+1 where hid="+session.getAttribute("h_no");
stmt.executeUpdate(query);
rs.close();
conn.close();

         %>
         <jsp:forward page="hostel_info.jsp" >
  <jsp:param name="message" value="Hostel created Successfully" />
  <jsp:param name="type" value="success"/>
</jsp:forward>

<%
}catch(Exception e)
{
out.println(e.toString());
}
%>
