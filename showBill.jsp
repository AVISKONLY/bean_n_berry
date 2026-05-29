<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
<%
int orderno=0;
int noofitems=0;
int totalAmt=0;
try
{
	
int billno = Integer.parseInt(request.getParameter("billno"));
int TableNo = Integer.parseInt(request.getParameter("tableno"));

Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	
	ResultSet rs;
   rs = st.executeQuery("select * from  order_menu where billno="+billno);
   %>
   <center>
   <table width="50%" cellpadding="10px" bgcolor="yellow">
   <tr><th colspan="6"><h2>Bill No : <%=billno %> | Table No. <%=TableNo %> </h2></th></tr>
  <tr>
    <th>Order No.</th>
    <th>Name of Item</th>
    <th>Qty</th>
    <th>Rate</th>
    <th>Amt</th>
    <th></th>
  </tr>
  


   <%
   while(rs.next())
   {
	   %>
	   <tr>
     <th><%=rs.getInt("orderno") %></th>
    <th><%=rs.getString("name") %></th>
    <th><%=rs.getInt("qty") %></th>
    <th><%=rs.getInt("amt") %></th>
    <th><%=rs.getInt("amt") %></th>
    <th><a href="deleteItemFromBill.jsp?orderno=<%=rs.getInt("orderno")%>&billno=<%=rs.getInt("billno")%>&tableno=<%=rs.getInt("tableno")%>">Delete this</a></th>
  </tr>
	   <%
   }
   
   rs = st.executeQuery("select sum(amt), count(*) from  order_menu where billno="+billno);
   while(rs.next())
   {
	  totalAmt = Integer.parseInt(rs.getString("sum(amt)"));
	  noofitems = Integer.parseInt(rs.getString("count(*)"));
   }
con.close();

}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>
<tr><th colspan="6"><h2>Total Amt. : Rs. <%=totalAmt %>.00 for <%=noofitems %> items </h2></th></tr>
<tr><th colspan="6">

<%
if ((session.getAttribute("auserid") == null) || (session.getAttribute("auserid") == "")) {%>

<a href="order.jsp?cat=salad">Add More items to this Bill</a>  <a href="submitBill.jsp">Submit this bill..</a>

<%}else{
%>
<a href="showAllBills.jsp">Back to All Bills</a>
<%} %></th></tr>
</table>
</center>