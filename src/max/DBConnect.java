package max;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private DBConnect(){}
	
	private static Connection con;
	static
	{
		try {
			Class.forName("org.postgresql.Driver");
			String url="jdbc:postgresql://localhost:5432/feb24";
			 con = DriverManager.getConnection(url, "postgres", "123456");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static Connection getconn()
	{
		return con;
		
	}

}
