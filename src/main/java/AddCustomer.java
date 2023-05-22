

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.DatabaseConnection;

/**
 * Servlet implementation class AddCustomer
 */
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
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
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("mobile");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String pincode = request.getParameter("pincode");
		
		try {
			Connection con = DatabaseConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into customer values(?,?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, phone);
			ps.setString(5, gender);
			ps.setString(6, address);
			ps.setString(7, pincode);
			ps.executeUpdate();
			
			response.sendRedirect("customer-login.jsp?msg=register");
		}catch(Exception e)
		{
			response.sendRedirect("customer-register.jsp?msg=notRegister");
			System.out.println(e);
		}
		
		
		
	}

}
