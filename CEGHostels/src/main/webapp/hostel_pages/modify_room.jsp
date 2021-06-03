<%@ page contentType="text/html" language="java" import="java.sql.*" errorPage="" %>
<head>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>

<%
	    String room_no=request.getParameter("room_no");
	    String id=request.getParameter("id");
	    
            try{
            	Class.forName("com.mysql.cj.jdbc.Driver");   
            	Connection conn=DriverManager.getConnection(  
            	    		"jdbc:mysql://localhost:3306/hms","root","jesus@111"); 
                  Statement stmt = conn.createStatement();
	          if(!(room_no.matches("[0-9]+"))){
		        %>
		        <jsp:forward page="allot_room.jsp" >
		        <jsp:param name="message" value="Allot a valid room" />
		        </jsp:forward><%
	           }
	        else{
		String query="update student_hostel set room_no="+room_no+" where student"
 + "_id="+id;
		stmt.executeUpdate(query);
		%>
		    <jsp:forward page="student_info.jsp" >
		    <jsp:param name="message" value="Room alloted successfully" />
		    <jsp:param name="type" value="success"/>
		    </jsp:forward>
<%
		}
    }catch(Exception e)
{
out.println(e.toString());
}
	    %>