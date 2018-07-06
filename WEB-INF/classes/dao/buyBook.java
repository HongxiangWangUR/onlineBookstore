package dao;

import java.sql.*;

public class buyBook{
	public boolean purchase(int[] nums,String username){
		Connection conn=null;
		PreparedStatement ps=null;
		try{
			conn=databaseConnect.getLocaleConnection();
			conn.setAutoCommit(false);
			for(int i=0;i<nums.length;i++){
				int book_id=i+1;
				int num=nums[i];
				if(num>0){
					//update Book table
					ps=conn.prepareStatement("update Book set amount=amount-? where id=?");
					ps.setInt(1,num);
					ps.setInt(2,book_id);
					ps.executeUpdate();
					//update Book_Order table;
					ps=conn.prepareStatement("insert into Book_Order(book_id,username,amount) values(?,?,?)");
					ps.setInt(1,book_id);
					ps.setString(2,username);
					ps.setInt(3,num);
					ps.executeUpdate();
				}
			}
			conn.commit();
		}catch(Exception e){
			try{
				conn.rollback();
			}catch(Exception ex){

			}
			e.printStackTrace();
			return false;
		}finally{
			try{
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e){

			}
		}
		return true;
	}
}