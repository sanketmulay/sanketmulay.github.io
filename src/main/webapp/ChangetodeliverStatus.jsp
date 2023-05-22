<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%

String date = request.getParameter("date");

String id = request.getParameter("id");

try{
	Connection con = DatabaseConnection.getCon();
	Statement st = con.createStatement();
	st.executeUpdate("update orders set status='deliver' where id="+id+" AND dateAndTime='"+date+"'");
	
	response.sendRedirect("admin-all-orders.jsp?msg=orderDelivered");
}catch(Exception e)
{
	response.sendRedirect("admin-all-orders.jsp?msg=orderNotDelivered");

	e.printStackTrace();
}


%>