<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%

try
{
	out.print("0");
int orderno = Integer.parseInt(request.getParameter("orderno"));
out.print("0.1");
int BillNo = Integer.parseInt(request.getParameter("billno"));
int tableno = Integer.parseInt(request.getParameter("tableno"));
out.print("1");
Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	String qry = "delete from order_menu where orderno ="+orderno;
	out.print("2");
	st.executeUpdate(qry);
	out.print("3");
	response.sendRedirect("showBill.jsp?billno="+BillNo+"&tableno="+tableno);
con.close();

}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>
