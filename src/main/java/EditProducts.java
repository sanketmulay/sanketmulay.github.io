
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import connection.DatabaseConnection;

/**
 * Servlet implementation class EditProducts
 */
public class EditProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProducts() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		response.setContentType("text/html");
		String id = request.getParameter("id");
		String productName = request.getParameter("pname");
		String productPrice = request.getParameter("price");
		String productMRPPrice = request.getParameter("mprice");
		String productDescription = request.getParameter("description");
		String status = request.getParameter("status");
		String productCategory = request.getParameter("category");

		

		try {
			Connection con = DatabaseConnection.getCon();
//			PreparedStatement ps = con.prepareStatement(
//					"update product set productName='"+productName+"',productPrice="+productPrice+",productMRPPrice="+productMRPPrice+",productDescription='"+productDescription+"',status='"+status+"',productCategory='"+productCategory+"' where id="+id+"");
			Statement st = con.createStatement();
			st.executeUpdate("update product set productName='"+productName+"',productPrice="+productPrice+",productMRPPrice="+productMRPPrice+",productDescription='"+productDescription+"',status='"+status+"',productCategory='"+productCategory+"' where id="+id+"");
			
			response.sendRedirect("admin-view-product.jsp?msg=update");
		} catch (Exception e) {
			response.sendRedirect("admin-view-product.jsp?msg=notUpdate");

			System.out.println(e);
		}

	}

}
