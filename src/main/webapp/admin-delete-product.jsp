<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String id = request.getParameter("id");

try{
	Connection con = DatabaseConnection.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from product where id="+id+"");
	response.sendRedirect("admin-view-product.jsp?msg=delete");
	
}catch(Exception e)
{
	response.sendRedirect("admin-view-product.jsp?msg=notDelete");

	System.out.println(e);
}


%>