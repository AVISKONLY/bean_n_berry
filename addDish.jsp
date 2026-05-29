<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%

try
{
	out.print("0");
	int id = Integer.parseInt(request.getParameter("id"));
	out.print("1");
	String name = request.getParameter("name");
	out.print("1.1");
	String cat = request.getParameter("cat");
	out.print("1.2");
	int price = Integer.parseInt(request.getParameter("price"));
	out.print("1.3");
	
Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	System.out.println("Connection Established");

	Statement st = con.createStatement();
	
	String qry = "insert into menu values ("+id+",'"+name+"','"+cat+"',"+price+")";
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
