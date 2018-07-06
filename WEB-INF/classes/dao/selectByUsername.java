package dao;

import java.sql.*;

public class selectByUsername{
	public boolean getUser(String username){
		String sql="select * from User where username=?";
		Connection conn=null;
		PreparedStatement sta=null;
		ResultSet rs=null;
		try{
			conn=databaseConnect.getLocaleConnection();
			if(conn==null){
				throw new Exception("database connect error");
			}
			sta=conn.prepareStatement(sql);
			sta.setString(1,username);
			rs=sta.executeQuery();
			if(rs==null||!rs.next())
				return false;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(conn!=null)
					conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return true;
	}
}