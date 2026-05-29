<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%

try
{
	out.print("0");
	int id = Integer.parseInt(request.getParameter("id"));
	
	
Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	String qry = "delete from menu where id="+id;
	out.print("2");
	st.executeUpdate(qry);
	out.print("3");
	response.sendRedirect("addEditDish.jsp");
con.close();

}
catch(Exception ex)
{
	out.println(ex.toString());
}
%>
