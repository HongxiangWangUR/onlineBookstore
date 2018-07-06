package dao;
import java.sql.*;
public class deleteOrder{
	public boolean delete(int order_id){
		try(Connection conn=databaseConnect.getLocaleConnection();PreparedStatement ps=conn.prepareStatement("delete from Book_Order where order_id=?");){
			ps.setInt(1,order_id);
			int result=ps.executeUpdate();
			if(result<=0)
				throw new Exception();
		}catch(Exception e){
			return false;
		}
		return true;
	}
}