<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
<%
int itemId=0;
try
{
	


Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	
	ResultSet rs;
   rs = st.executeQuery("select * from  menu");
   Statement st1 = con.createStatement();
   ResultSet rs1;
   rs1 = st1.executeQuery("select max(id) from  menu");
   while(rs1.next())
   {
   	   itemId=rs1.getInt("max(id)");
   }
   itemId++;
   %>
   <center>
   <form name ="frmAddDish" action="addDish.jsp" method="POST">
   <table width="50%" cellpadding="10px" bgcolor="grey">
    <tr><th colspan="5"><h1>Manager Panel </h1></th></tr>
     <tr><th colspan="5"><h2>Add | Delete Dishes to the menu </h2></th></tr>
   <tr><th>Item Id</th><th>Name of Dish</th><th>Category </th><th>Price</th><th></th></tr>
   <tr><th><input type="text" name="id" value="<%=itemId%>" readonly></th><th><input type="text" name="name" value=""></th><th>
   
   <select name="cat">
  <option value="beverage">Beverage</option>
  <option value="soup">Soup</option>
  <option value="starter">Starter</option>
  <option value="maincourse">Main Course</option>
  <option value="breadnrice">Bread & Rice</option>
  <option value="raita">Raita</option>
  <option value="dessert">Dessert</option>
  <option value="salad">Salad</option>
</select> </th><th><input type="text" name="price" value=""></th><th><input type="submit" value="+"></th></tr>
     <%
   while(rs.next())
   {
	   %>
	   <tr>
     <th><%=rs.getInt("id") %></th>
    <th><%=rs.getString("name") %></th>
    <th><%=rs.getString("cat") %></th>
    <th><%=rs.getInt("price") %></th>
    <th><a href="deleteItemFromMenu.jsp?id=<%=rs.getInt("id")%>">-</a></th>
    
   
  </tr>
	   <%
   }
   
  
   
con.close();

}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>

<tr><th colspan="5"><a href ="showAllBills.jsp">Show All Bills</a> <a href ="showReport.jsp">Show Report </a> <a href="logout.jsp">logout</a></th></tr>
</table>
</form>
</center>