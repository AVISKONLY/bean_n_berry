<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import= "java.io.*" %>
    <%@ page import="oracle.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="stylesheet2.css">

</head>
<%
int TableNo = (Integer)session.getAttribute("tableno");
int item_id=0;
String cat = request.getParameter("cat");
String bg="";

int category=0;
if(cat.equals("salad"))
{
	category=1;
}
else if (cat.equals("soup"))
{
	category=2;
	
}
else if (cat.equals("beverage"))
{
	category=3;
}
else
{
	
}
	
	switch(category)
{
	case 1:
	{
		bg="https://images6.alphacoders.com/450/450480.jpg";
		break;
	}
	case 2:
	{
		bg="https://www.knorr.in/content/dam/unilever/knorr_world/india/general_image/savoury/savoury_unidentified/shanghai-hot&sour-chicken-soup-936384.png";
		break;
	}
	case 3:
	{
		bg="https://s3.scoopwhoop.com/anj/cocktail/283069561.jpg";
		break;
	}
}
%>
<body background="<%=bg%>">


<div class="title" style="text-transform: uppercase;"><%=cat %></div> 
<div style="text-align:center;" >
<a href="order.jsp?cat=beverage" id="name1">Beverages</a>
<a href="order.jsp?cat=soup" id="name2">Soups</a>
<a href="order.jsp?cat=starter" id="name3">Starters</a>
<a href="order.jsp?cat=maincourse" id="name4">Main Course</a>
<a href="order.jsp?cat=breadnrice" id="name5">Bread n Rice</a>
<a href="order.jsp?cat=salad" id="name6">Salad</a>
<a href="order.jsp?cat=raita" id="name7">Raita</a>
<a href="order.jsp?cat=dessert" id="name8">Desserts</a>

<form action="dbOrder.jsp" method="post">
<table class="table" width="80%">
<tr><td colspan="3"><%=(String)session.getAttribute("msg") %></td></tr>
<%
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","saurav","singh");
	
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from menu where cat='"+cat+"'");
	while(rs.next())
	{
		


%>

	<tr>
		
		<td class="name"><label for="chekbox"><%
				String s=rs.getString(2);
				out.print(s);%></label></td>
		<td class="amount"><%=rs.getInt(4) %></td> 
		
		
		<td class ="name"><a href="dbOrder.jsp?id=<%=rs.getInt(1)%>&amt=<%=rs.getInt(4)%>&name=<%=rs.getString(2)%>&cat=<%=cat%>">Order this</a></td>
		</tr>
<% 
		
	}
	con.close();
}
catch(Exception a)
{
	System.out.println(a);
	
}


%>
<tr><td colspan="3"><a href="showBill.jsp?billno=<%=(Integer)session.getAttribute("billno")%>&tableno=<%=TableNo%>">Done >> Show bill..</a></td></tr>
</table>
</div> 

</form>

</body>
</html>