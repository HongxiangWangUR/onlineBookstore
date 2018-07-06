package dao;

import java.sql.*;

public class signup{
	public boolean addUser(String username,String password,String email){
		String sql="insert into User(username,password,email) values(?,?,?)";
		try(Connection conn=databaseConnect.getLocaleConnection();PreparedStatement ps=conn.prepareStatement(sql);)
		{
			ps.setString(1,username);
			ps.setString(2,password);
			ps.setString(3,email);
			int result=ps.executeUpdate();
			if(result<=0){
				return false;
			}else{
				return true;
			}
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
	}
}