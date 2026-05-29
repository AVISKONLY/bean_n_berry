<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%
try
{
	
int BillNo = (Integer)session.getAttribute("billno");

int item_id = Integer.parseInt(request.getParameter("id"));

int qty = 1;

int amt = Integer.parseInt(request.getParameter("amt"));

int TableNo = (Integer)session.getAttribute("tableno");
String cat=request.getParameter("cat");
String name = request.getParameter("name");

out.println(BillNo);

out.println(request.getParameter("id"));


Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	int orderno=0;
	ResultSet rs;
   rs = st.executeQuery("select max(orderno) from  order_menu");
   
   while(rs.next())
   {
	   orderno=Integer.parseInt(rs.getString("max(orderno)"));
   }
   orderno++;
   
  // out.print("Order No :"+orderno);
   
   int i = st.executeUpdate("insert into order_menu (orderno,billno, id, qty, amt, dt, tableno, name) values (" + orderno + "," + BillNo + "," + item_id + "," + qty + "," + amt + ", sysdate, "+TableNo+",'"+name+"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        String msg=(String)session.getAttribute("msg");
        msg+="<br>Item "+name+" added successfully in Bill No. "+BillNo;
        session.setAttribute("msg",msg);
        response.sendRedirect("order.jsp?cat="+cat);
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	session.setAttribute("msg","Item "+name+" could not be added in Bill No. "+BillNo);
    	response.sendRedirect("order.jsp?cat="+cat);
    }
con.close();

}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>