package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BuyBookDao {
	
	
	 Connection conn = null;
	   PreparedStatement psmt = null;
	   ResultSet rs = null;
	   
	   public void connect() throws Exception{
	      String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 접속 DB정보
	      String db_id = "scott"; // 접속 아이디
	      String db_pw = "tiger"; // 접속 아이디의 비밀번호

	   
	   try {
	      Class.forName("oracle.jdbc.driver.OracleDriver"); //  드라이버 가져오기 

	      if(conn != null) {
	         conn.close();
	      }
	      conn = DriverManager.getConnection(db_url, db_id, db_pw);

	   } catch (ClassNotFoundException | SQLException e) {
	      // TODO Auto-generated catch block
	      e.printStackTrace();
	      throw e;
	   }
	}
	   
	   public void disconnect() {
	      try {
	         if(rs != null) {
	            rs.close();   
	         }
	         if(psmt != null) {
	            psmt.close();
	         }
	         if(conn != null) {
	            conn.close();
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	   }
	
	
	
	public int insertBuyBook(BuyBook bb) { // 구매테이블에 담기 

		   
		String sql = "insert into buy_book values(?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
				
		int result = 0;
		

		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bb.getId());
			psmt.setString(2, bb.getEmail());
			psmt.setString(3, bb.getAddress());
			psmt.setString(4, bb.getIsbn());
			psmt.setInt(5, bb.getPrice());
			psmt.setString(6, bb.getPay_meth());
			psmt.setString(7, bb.getOrder_num());
			psmt.setString(8, bb.getOrder_status());
	
			result = psmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return result;
	}
}
