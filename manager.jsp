<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="stylesheet5.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<br><br><br><br><br><br>
<h2> Manager Login Page </h2>
 
        
        <form method="post" action="adminlogin.jsp">
            <center>
            <table>
                <thead>
                    <tr>
                        <th colspan="2">Admin Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login"/></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                   
                </tbody>
            </table>
            </center>
        </form>
<br><br><br><br><br><br><br>
</body>
</html>