package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.Book;
import dao.cart;



public class cartDao {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 접속 DB정보
		String db_id = "scott"; // 접속 아이디
		String db_pw = "tiger"; // 접속 아이디의 비밀번호

		Class.forName("oracle.jdbc.driver.OracleDriver");

		if(conn != null) {
			conn.close();
		}
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
	}

	public void disConnect() {
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
	
	public cart selectBuyBookInfo(String id){
		String sql = " select * "
				   + " from book "
				   + " where isbn = "
				   + " (select tsbn from shop_bskt where id = ? ) ";
		cart cartInfo = null;
		
		try {
			connect();
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			cartInfo = new cart();
			if(rs.next()) {
				
				cartInfo.setId(rs.getString("id"));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
		
		return cartInfo;
	}
	
	
	
//	기존 장바구니 인서트 하는 메소드 지우면 안됨 
//	public int insertBookInCart(cart ct) { // 장바구니 담기 
//
//		   
//		String sql = "insert into shop_bskt values(?,?,1)";
//				
//		int result = 0;
//		
//
//		try {
//			connect();
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, ct.getId());
//			psmt.setString(2, ct.getIsbn());
//			
//			
//			result = psmt.executeUpdate();
//		
//		}catch(Exception e) {
//			e.printStackTrace();
//		}finally {
//			disConnect();
//		}
//		return result;
//	}
	
	
	//테이블 customer_no 만들고 다시 insert만든거 지우면 안됨 
	public int insertBookInCart(cart ct) { // 장바구니 담기 

		   
		String sql = " INSERT INTO shop_bskt "
				   + " VALUES ((SELECT NVL(MAX(customer_no),0)+1 FROM shop_bskt), ? , ? , ? , 1 ) ";
				
		int result = 0;
		

		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, ct.getId());
			psmt.setString(2, ct.getIsbn());
			psmt.setInt(3, ct.getPrice());
			
			
			result = psmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			disConnect();
		}
		return result;
	}
	
	
	
	
	
	
	
}
