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
					rv2.setReveiw_date(rs.getDate("review_date"));
					
					
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
	   
//	   마이페이지에서 주문내역 정보 불러오는 메소드 
	   public List<BuyBook> selectBuyListById(String id){
			String sql = " select order_date, price,order_status,title from buy_book where id = ? ";
			List<BuyBook> bb = null;
			
			try {
				connect();
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				
				rs = psmt.executeQuery();
				
				bb = new ArrayList<BuyBook>();
				
				while(rs.next()) {
					BuyBook bb2 = new BuyBook();
					bb2.setOrder_date(rs.getDate("order_date"));
					bb2.setPrice(rs.getInt("price"));
					bb2.setOrder_status(rs.getString("order_status"));
					bb2.setTitle(rs.getString("title"));
					
					
					bb.add(bb2);
				}
			
				return bb;
				
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return bb;
		}
	   
	   
//	   주문내역에 썸네일도 화면에 나오게 하려고 만들어본 메소드 
	   public List<Book> selectBuyListCoverById(String id,String isbn){
			String sql = " select  k.titlefrom buy_book b, book k "
						+ " where id = ? and b.book_num = ? ";
			
			List<Book> bk = null;
			
			try {
				connect();
				
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, isbn);
				
				rs = psmt.executeQuery();
				
				bk = new ArrayList<Book>();
				
				while(rs.next()) {
					Book bk2 = new Book();
					bk2.setTitle(rs.getString("title"));
					
					
					bk.add(bk2);
				}
			
				return bk;
				
			}catch (Exception e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return bk;
		}
	   
	   
	   
//	   public List<Book> selectBuyListCover(String isbn){
//			String sql = " select title from book where isbn = ? ";
//			
//			List<Book> bk = null;
//			
//			try {
//				connect();
//				
//				psmt = conn.prepareStatement(sql);
//		
//				psmt.setString(1, isbn);
//				
//				rs = psmt.executeQuery();
//				
//				bk = new ArrayList<Book>();
//				
//				while(rs.next()) {
//					Book bk2 = new Book();
//					bk2.setTitle(rs.getString("title"));
//					
//					
//					bk.add(bk2);
//				}
//			
//				return bk;
//				
//			}catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				disconnect();
//			}
//			
//			return bk;
//		}
//	 
	
}
