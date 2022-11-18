package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MypageDao {

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
	   
	   // 리뷰 목록 리스트로 가져와야되는데 잘못만든거 
//	   public Review selectReviewById(String id){
//			String sql = " select review_date, review_title from review where id = ? ";
//			Review reviewInfo = null;
//			
//			try {
//				connect();
//				
//				psmt = conn.prepareStatement(sql);
//				psmt.setString(1, id);
//				
//				rs = psmt.executeQuery();
//				
//				reviewInfo = new Review();
//				if(rs.next()) {
//					
//					reviewInfo.setId(rs.getString("id"));
//				}
//				
//			}catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				disconnect();
//			}
//			
//			return reviewInfo;
//		}
	   
	   
	   public List<Review> selectReviewById(String id){
			String sql = " select review_date, review_title from review where id = ? ";
			List<Review> rv = null;
			
			try {
				connect();
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				
				rs = psmt.executeQuery();
				
				rv = new ArrayList<Review>();
				
				while(rs.next()) {
					Review rv2 = new Review();
					rv2.setReview_title(rs.getString("review_title"));
					rv2.setReveiw_date(rs.getDate("reveiw_date"));
					
					
					rv.add(rv2);
				}
			
				return rv;
				
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return rv;
		}
	
}
