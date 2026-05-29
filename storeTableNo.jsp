<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
int tno = Integer.parseInt(request.getParameter("tno"));
int bno = Integer.parseInt(request.getParameter("bno"));
//out.println(tno);
session.setAttribute("tableno", tno);
session.setAttribute("billno",bno);

response.sendRedirect("user.jsp");
%>