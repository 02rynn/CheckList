package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class bBsDAO {// 정보를 빼올 수 있도록 해주는 클래스

	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement psmt = null;

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

			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Review> select_bbs_contents() {
		String sql = "SELECT * FROM REVIEW order by review_num";
		// 사용자들이 후기를 쓰면 그걸 게시판 형태로 보여주기 위한 함수

		List<Review> rvList = null; // 리뷰클래스를 갖는 리스트
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery(); // sql문 결과 담겨잇음

			rvList = new ArrayList<Review>();

			while (rs.next()) {
				Review rv = new Review();
				rv.setId(rs.getString("id"));
				rv.setReveiw_date(rs.getDate("review_date"));
				rv.setReview_contents(rs.getString("review_contents"));
				rv.setReview_num(rs.getInt("review_num"));
				rv.setReview_rate(rs.getInt("review_rate"));
				rv.setReview_title(rs.getString("review_title"));
				rv.setTitle(rs.getString("title"));

				rvList.add(rv); // 위에서 저장한 값들을 리스트에 담아서
			}

			return rvList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnect();
		}

		return rvList;
	}

	public int insert_review_contents(String title, int review_rate, String review_title, String review_contents,
			String user, String isbn) {
		String sql = "INSERT INTO review VALUES('" + user
				+ "',?,?,SYSDATE,?,?,(SELECT NVL(MAX(review_num),0)+1 FROM REVIEW),'" + isbn + "')";
		// 사용자들이 후기를 쓰면 그걸 데이터베이스에 INSERT하기 위한 함수
		int result = 0;

		try {
			connect();
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, title);
			psmt.setString(2, review_contents);
			psmt.setInt(3, review_rate);
			psmt.setString(4, review_title);

			result = psmt.executeUpdate();
			// int resultCnt = psmt.executeUpdate();
			// System.out.println(resultCnt);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnect();
		}

		return result;
	}

	public List<Book> selectBuyBookList(String id) { // 이거 건들면 죽음

		try {
			connect();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		List<Book> bookList = null;
		String sqlQuery = "select title from book where isbn = (select book_num from buy_book where id = ? )";
		try {
			psmt = conn.prepareStatement(sqlQuery);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			bookList = new ArrayList<Book>();
			while (rs.next()) {
				Book ai = new Book();

				ai.title = rs.getString("Title");
				ai.isbn = rs.getString("isbn");
				bookList.add(ai);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnect();
		}

		return bookList;
	}

	public List<Review> select_bbs_contents_by_title(String title) {
		String sql = "SELECT * FROM REVIEW WHERE title = ? order by review_num";
		// 사용자들이 후기를 쓰면 그걸 게시판 형태로 보여주기 위한 함수

		List<Review> rvList = null; // 리뷰클래스를 갖는 리스트
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			rs = psmt.executeQuery(); // sql문 결과 담겨잇음

			rvList = new ArrayList<Review>();

			while (rs.next()) {
				Review rv = new Review();
				rv.setId(rs.getString("id"));
				rv.setReveiw_date(rs.getDate("review_date"));
				rv.setReview_contents(rs.getString("review_contents"));
				rv.setReview_num(rs.getInt("review_num"));
				rv.setReview_rate(rs.getInt("review_rate"));
				rv.setReview_title(rs.getString("review_title"));
				rv.setTitle(rs.getString("title"));

				rvList.add(rv); // 위에서 저장한 값들을 리스트에 담아서
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnect();
		}

		return rvList;
	}

	public int updateBbs(int review_num, String review_title, String review_contents, int review_rate) { // 게시글의 글제목과
																											// 평점, 글 내용을
																											// 수정할 수 있는
																											// 기능
		String sql = " UPDATE  review SET review_rate =?, review_title=?, review_contents=? where review_num=?";

		int result = 0;

		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, review_rate);
			psmt.setString(2, review_title);
			psmt.setString(3, review_contents);
			psmt.setInt(1, review_num);

			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnect();
		}
		return result;
	}

	public int deleteBbs(int review_num) {
		String sql = " DELETE review " + " WHERE id=? ";
		int result = 0;

		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, review_num);
			result = psmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConnect();
		}
		return result;
	}

}
