package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	public static Connection getCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/groceryshop","root","San@1234");
			System.out.println("connected");
			return con;
		}catch(Exception e)
		{
			System.out.println(e);
		}
		return null;
	}
}
