<%@ page contentType="text/html" language="java"
import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<%@ include file="banner.jsp" %>
<html>
    <body>
    <br>
    <br>
    <center>
        <form action="student.jsp" method="post">
			Enter Rollno<input type="text" name="rollno"/><br/>
           <br/>
           <input type="submit" value="Submit"/>
		</form>
		</center>
    </body>
</html>
