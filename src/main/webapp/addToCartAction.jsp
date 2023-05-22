
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%
String email = session.getAttribute("email").toString();

String productId = request.getParameter("id");

int quantity=1;

String productName=null;
String fileName=null;
int productPrice=0;
int productMRPPrice=0;
String status="cart";




try{
	Connection con = DatabaseConnection.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from product where id="+productId+"");
	while(rs.next()){
		productName=rs.getString("productName");
		fileName=rs.getString("fileName");
		productPrice = rs.getInt("productPrice");
		productMRPPrice = rs.getInt("productMRPPrice");
	}
	int totalAmount=quantity*productPrice;
	PreparedStatement ps = con.prepareStatement("insert into cart(productName,fileName,productPrice,productMRPPrice,totalAmount,quantity,email,status) values(?,?,?,?,?,?,?,?)");
	ps.setString(1,productName );
	ps.setString(2,fileName);
	ps.setInt(3,productPrice );
	ps.setInt(4, productMRPPrice);
	ps.setInt(5,totalAmount );
	ps.setInt(6,quantity);
	ps.setString(7,email);
	ps.setString(8, status);
	ps.executeUpdate();
	response.sendRedirect("index.jsp?msg=addToCart");
	}catch(Exception e)
{
		response.sendRedirect("index.jsp?msg=notAddToCart");

	e.printStackTrace();
}

%>