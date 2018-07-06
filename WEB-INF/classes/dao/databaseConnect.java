package dao;
import java.sql.*;

public class databaseConnect{
	private final static String driver="com.mysql.jdbc.Driver";
	private final static String url="jdbc:mysql://localhost:3306/bookstore";
	private final static String username="root";
	private final static String password="1234";

	public static Connection getLocaleConnection(){
		Connection conn=null;
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,username,password);
		}catch(Exception e){

		}
		return conn;
	}
}