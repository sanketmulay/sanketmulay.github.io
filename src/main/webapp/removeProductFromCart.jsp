
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");

try{
	Connection con  = DatabaseConnection.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("delete from cart where id="+id+" AND email='"+email+"'");
	response.sendRedirect("checkout.jsp?msg=remove");
}catch(Exception e)
{
	response.sendRedirect("checkout.jsp?msg=notRemove");

	e.printStackTrace();
}

%>