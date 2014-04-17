package Connection;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager
{
	static Connection conn;

	public static Connection getConnection()
	{
		try
		{
			String url = "jdbc:mysql://localhost:3306/";
			String dbName ="sportsbooking"; 
			String username = "root";
			String password = "root";

			Class.forName("com.mysql.jdbc.Driver");
			try
			{
				conn = DriverManager.getConnection(url+dbName,username,password);
			}
			catch (SQLException ex)
			{
				ex.printStackTrace();
			}
		}
		catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}
		return conn;
	}

}