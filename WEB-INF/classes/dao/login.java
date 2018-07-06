package dao;
import java.sql.*;

public class login{
	public boolean loginCheck(String username,String password){
		String sql="select * from User where username=? and password=?";
		Connection conn=null;
		PreparedStatement sta=null;
		ResultSet rs=null;
		try{
			conn=databaseConnect.getLocaleConnection();
			if(conn==null){
				System.out.println("get connection error");
				return false;
			}
			sta=conn.prepareStatement(sql);
			sta.setString(1,username);
			sta.setString(2,password);
			rs=sta.executeQuery();
			if(rs==null)
				return false;
			rs.last();
			if(rs.getRow()!=1)
				return false;
		}catch(Exception e){

		}finally{
			try{
				if(conn!=null)
					conn.close();
			}catch(Exception e){

			}
		}
		return true;
	}
}