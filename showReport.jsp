<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
<%

try
{
	int totalSales=0;
	int totalCustomers=0;
	String mostExpensiveDish="";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	
	ResultSet rs;
  
   %>
   <center>
   <table width="60%" cellpadding="10px" bgcolor="grey">
    <tr><th colspan="2"><h1>Manager Panel </h1></th></tr>
    <tr><th colspan="2"><h2>Reports </h2></th></tr>
   
     <%
     rs = st.executeQuery("select sum(amt) from order_menu where To_Date(dt)=trunc(sysdate)");
     while(rs.next())
     {
  	  totalSales = Integer.parseInt(rs.getString("sum(amt)"));
  	  
     }
  %>
	   <tr>
     <th>Total Sales today </th>
    <th><%=totalSales %></th>
   
  </tr>
	  <%
     rs = st.executeQuery("select count(*) from order_menu where To_Date(dt)=trunc(sysdate) group by billno");
     while(rs.next())
     {
  	  totalCustomers = Integer.parseInt(rs.getString("count(*)"));
  	  
     }
  %>
	   <tr>
     <th>No. of customers today </th>
    <th><%=totalCustomers %></th>
   
  </tr> 
   
    <%
     rs = st.executeQuery("select name from menu where price = (select max(price) from menu)");
     while(rs.next())
     {
  	  mostExpensiveDish = rs.getString("name");
  	  
     }
  %>
	   <tr>
     <th>Most Expensive Dish </th>
    <th><%=mostExpensiveDish %></th>
   
  </tr> 
   
  <%
   
con.close();

}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>

<tr><th colspan="2"><a href ="showAllBills.jsp">Show All Bills</a> <a href ="addEditDish.jsp">Add/ Edit / Delete Dishes in the menu </a> <a href ="">Show Report </a> <a href="logout.jsp">logout</a></th></tr>
</table>
</center>