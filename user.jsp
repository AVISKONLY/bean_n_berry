<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="stylesheet1.css">
<meta charset="ISO-8859-1">
<title>Welcome page</title>
</head>
<body>
<div id="welcome">Welcome to eMenu....</div>

<%
int BillNo=0;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","saurav","singh");


Statement stmt=con.createStatement();
ResultSet rs;
rs = stmt.executeQuery("select max(billno) from  order_menu");

while(rs.next())
{
	   BillNo=Integer.parseInt(rs.getString("max(billno)"));
}
BillNo++;

%>
<form id="form" action="storeTableNo.jsp" method="" >
<label for="billno">Bill no:</label>
<input type ="text" name="bno" value="<%=BillNo %>" readonly="true">


<label for="tableno">Table no:</label>
<input type="text" value=""  id="tableno" name="tno" required>
<input type=submit value="Enter">

<div id="menu">Menu</div>
<img src="https://s3.scoopwhoop.com/anj/cocktail/283069561.jpg" id="pic1" height="60" width="60">
<a href="order.jsp?cat=beverage" id="name1">Beverages</a>
<img src="https://food.fnr.sndimg.com/content/dam/images/food/fullset/2014/7/17/1/FN_Simple-Chicken-Soup_s4x3.jpg.rend.hgtvcom.616.462.suffix/1408067446307.jpeg" id="pic2" height="60" width="60">
<a href="order.jsp?cat=soup" id="name2">Soups</a>
<img src="http://www.godine.co.uk/blog/wp-content/uploads/2009/12/Thai-starters-and-snacks.jpg" id="pic3" height="60" width="60">
<a href="order.jsp?cat=starter" id="name3">Starters</a>
<img src="http://img.finedininglovers.com/?img=http%3A%2F%2Ffinedininglovers.cdn.crosscast-system.com%2FBlogPost%2FOriginal_11374_quesadillas-filled-chicken.jpg&w=1200&h=660&lu=1535249199&ext=.jpg" id="pic4" height="60" width="60">
<a href="order.jsp?cat=maincourse" id="name4">Main Course</a>
<img src="https://www.thekiwicountrygirl.com/wp-content/uploads/2018/06/Easy-Butter-Chicken-Recipe-4.jpg" id="pic5" height="60" width="60">
<a href="order.jsp?cat=breadnrice" id="name5">Bread n Rice</a>
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Salad_platter.jpg/1200px-Salad_platter.jpg" id="pic6" height="60" width="60">
<a href="order.jsp?cat=salad" id="name6">Salad</a>
<img src="https://www.manusmenu.com/wp-content/uploads/2013/02/Raita-1-1-of-1.jpg" id="pic7" height="60" width="60">
<a href="order.jsp?cat=raita" id="name7">Raita</a>
<img src="https://i.dietdoctor.com/wp-content/uploads/2018/07/DD_LC_Desserts_feature.jpg?auto=compress%2Cformat&w=1600&h=900&fit=crop" id="pic8" height="60" width="60">
<a href="order.jsp?cat=dessert" id="name8">Desserts</a>
</form>


</body>
</html>