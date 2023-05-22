

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import connection.DatabaseConnection;

/**
 * Servlet implementation class GetProductsOrder
 */
public class GetProductsOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductsOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String pincode = request.getParameter("pincode");
		String addressType = request.getParameter("addressType");
		String paymentMode = request.getParameter("payment");
		String status="placed";
		String status1="pending";
		String productName=null;
		String fileName=null;
		int quantity=0;
		int totalAmount=0;
		String dateAndTime=null;
		Date date = new Date();
		try {
			Connection con = DatabaseConnection.getCon();
			
			Statement st = con.createStatement();
			st.executeUpdate("update cart set status='"+status+"' where email='"+email+"'");
			
			ResultSet rs = st.executeQuery("select * from cart where status='placed' AND email='"+email+"'");
			while(rs.next()) {
				productName = rs.getString("productName");
				fileName = rs.getString("fileName");
				quantity = rs.getInt("quantity");
				totalAmount = rs.getInt("totalAmount");

			PreparedStatement ps = con.prepareStatement("insert into orders(name,email,phone,address,pincode,addressType,paymentMode,status,productName,fileName,quantity,totalAmount) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, address);
			ps.setString(5, pincode);
			ps.setString(6, addressType);
			ps.setString(7, paymentMode);
			ps.setString(8, status1);
			ps.setString(9, productName);
			ps.setString(10, fileName);
			ps.setInt(11, quantity);
			ps.setInt(12, totalAmount);
			ps.executeUpdate();
			}
			
		st.executeUpdate("delete from cart where status='"+status+"' And email='"+email+"'");
		
		ResultSet rs1 = st.executeQuery("select dateAndTime from orders where email='"+email+"' ORDER BY dateAndTime DESC LIMIT 1");
		while(rs1.next()) {
			dateAndTime = rs1.getString("dateAndTime");
		}
		
		response.sendRedirect("printInvoice.jsp?msg=orderPlaced&&name="+name+"&&address="+address+"&&email="+email+"&&phone="+phone+"&&pincode="+pincode+"&&date="+date+"&&dateAndTime="+dateAndTime+"");
		}catch(Exception e)
		{
			response.sendRedirect("checkout.jsp?msg=orderNotPlaced");

			e.printStackTrace();
		}
	}

}
