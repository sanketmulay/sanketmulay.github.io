

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
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

import connection.DatabaseConnection;

/**
 * Servlet implementation class AddProducts
 */

@MultipartConfig
public class AddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProducts() {
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
		
		response.setContentType("text/html");
		
		String productName= request.getParameter("pname");
		String productPrice = request.getParameter("price");
		String productMRPPrice = request.getParameter("mprice");
		String productDescription = request.getParameter("description");
		String status = request.getParameter("status");
		String productCategory = request.getParameter("category");
		
		Part part = request.getPart("image");
		
		String fileName = part.getSubmittedFileName();
		String filePath = "C:/Users/asus/eclipse-workspace/Online Grocery Shop/src/main/webapp/uploads/"+fileName+"";
		try {
			 FileOutputStream fos=new FileOutputStream(filePath);
			 InputStream is=part.getInputStream();
			 byte[] data=new byte[is.available()];
			 is.read(data);
			 fos.write(data);
			 fos.close();
		 }catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		
			
		
		try {
			Connection con = DatabaseConnection.getCon();
			PreparedStatement ps = con.prepareStatement("insert into product(productName,productPrice,productMRPPrice,productDescription,status,productCategory,filePath,fileName) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, productName);
			ps.setString(2, productPrice);
			ps.setString(3, productMRPPrice);
			ps.setString(4, productDescription);
			ps.setString(5, status);
			ps.setString(6, productCategory);
			ps.setString(7, filePath);
			ps.setString(8, fileName);
			ps.executeUpdate();
			
			response.sendRedirect("admin-add-product.jsp?msg=added");
		}catch(Exception e)
		{
			response.sendRedirect("admin-add-product.jsp?msg=notAdded");

			System.out.println(e);
		}
		
		
		doGet(request, response);
	}

}
