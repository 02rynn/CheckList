package dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

class DataDao{
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void connect() throws Exception {
		String db_url = "jdbc:oracle:thin:@localhost:1521:orcl"; // 접속 DB정보
		String db_id = "scott"; // 접속 아이디
		String db_pw = "tiger"; // 접속 아이디의 비밀번호

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 가져오기

			if (conn != null) {
				conn.close();
			}
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}

	public void closeConnect() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void insert_book_info(ArrayList<Book> bookList) {
		
		String sql = " INSERT INTO book VALUES(?,?,?,?,?,?,?,?,?) " ;		

			try {
				connect();
				psmt = conn.prepareStatement(sql);
				
				
					for(int i=0; i<bookList.size(); i++) {
						
					//북리스트에서 하나씩 받아와서  
						//FOR문을 돌리면서 arrayList에 있는 객체들을 하나씩 빼서 book에 저장해줘야 함. 
						Book book = new Book();
						
						book = bookList.get(i);
						
						
						psmt.setString(1, book.getIsbn());
				
						psmt.setString(2, book.getTitle());
						//System.out.println(book.getTitle());
						psmt.setString(3, book.getAuthors());
						psmt.setString(4, book.getContent());
						psmt.setString(5, book.getThumbnail());
						psmt.setInt(6, book.getPrice());
						psmt.setString(7, book.getDate_time());
						psmt.setString(8, book.getStatus());
						psmt.setInt(9,book.getCategory_id());
						int resultCnt = psmt.executeUpdate();
						System.out.println(resultCnt);
					}
					
			
		
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				closeConnect();
			}
			
		
		
	}
	
}