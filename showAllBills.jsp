<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <%@ page import ="java.sql.*" %>
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
<%
   
  String adminid= (String) session.getAttribute("auserid");
   System.out.println("Connection Established"+ adminid);
   out.println("Outside " + adminid);
if(adminid != null && !adminid.isEmpty())
   {
   
   int totalSales=0;
try
{
	


Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	
	ResultSet rs;
   rs = st.executeQuery("select billno, tableno, sum(amt) from  order_menu group by billno, tableno");
   %>
   <center>
   <table width="50%" cellpadding="10px" bgcolor="grey">
    <tr><th colspan="4"><h1>Manager Panel </h1></th></tr>
    <tr><th colspan="4"><h2>Show All Bills </h2></th></tr>
   <tr><th>Bill No</th><th>Table No</th><th>Amt. </th><th>Show Details/ Edit Bill</th></tr>
     <%
   while(rs.next())
   {
	   %>
         alert(adminid);
	   <tr>
     <th><%=rs.getInt("billno") %></th>
    <th><%=rs.getInt("tableno") %></th>
    <th><%=rs.getInt("sum(amt)") %></th>
    <th><a href="showBill.jsp?billno=<%=rs.getInt("billno")%>&tableno=<%=rs.getInt("tableno")%>">Show Details/ Edit Bill</a></th>
    
   
  </tr>
	   <%
   }
   
   rs = st.executeQuery("select sum(amt) from order_menu where To_Date(dt)=trunc(sysdate)");
   while(rs.next())
   {
	  totalSales = Integer.parseInt(rs.getString("sum(amt)"));
	  
   }
   
con.close();

}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>
<tr><th colspan="4"><h2>Total Sales : Rs. <%=totalSales %>.00  </h2></th></tr>
<tr><th colspan="4"></th></tr>
<tr><th colspan="4"><a href ="addEditDish.jsp">Add/ Edit / Delete Dishes in the menu </a> <a href ="showReport.jsp">Show Report </a> <a href="logout.jsp">logout</a></th></tr>
</table>
         
         
         
         
         <%
            
   }
            else
            {
            out.println("<h1>You are not authorised to view this page .." + adminid);
            }
            
            
            %>
             </center>