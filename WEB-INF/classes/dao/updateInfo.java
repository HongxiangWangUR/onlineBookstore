package dao;
import java.sql.*;

public class updateInfo{
	public boolean update(String username,String password,String email){
		try(Connection conn=databaseConnect.getLocaleConnection();
			PreparedStatement ps=conn.prepareStatement("update User set password=?,email=? where username=?");){
			ps.setString(1,password);
			ps.setString(2,email);
			ps.setString(3,username);
			ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
}