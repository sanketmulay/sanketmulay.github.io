

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

import org.apache.coyote.Request;

import connection.DatabaseConnection;

/**
 * Servlet implementation class LoginAction
 */
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
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
		HttpSession session = request.getSession();
		String username = request.getParameter("email");
		String password = request.getParameter("upass");
		
//		for admin login
		if(username.equalsIgnoreCase("Admin@gmail.com")&& password.equalsIgnoreCase("admin")) {
			session.setAttribute("email", username);
			response.sendRedirect("dashboard.jsp");
		}
		
//		for customer login
		
		int check=0;
		
		try {
			Connection con = DatabaseConnection.getCon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from customer where email='"+username+"' AND password='"+password+"'");
//			PreparedStatement ps = con.prepareStatement("select * from customer where email='"+username+"' AND password='"+password+"'");
			while(rs.next()) {
				session.setAttribute("email", username);
				check=1;
				response.sendRedirect("index.jsp?msg=loginSuccess");
			}
			
			if(check==0) {
				response.sendRedirect("customer-login.jsp?msg=notExit");
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
	}

}
