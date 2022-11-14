package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class CustomerDao {

	
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
	   
	   public int insertCustomerInfo(Customer cs) { // 회원가입 메소드 


		   
			String sql = "insert into customer values(customer_seq.nextval,?,?,?,?,sysdate,?,?)";
					
			int result = 0;
			

			try {
				connect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, cs.getId());
				psmt.setString(2, cs.getPassword());
				psmt.setString(3, cs.getEmail());
				psmt.setString(4, cs.getAddress());
				psmt.setString(5, cs.getPhone_num());
				psmt.setString(6, cs.getCustomer_name());
				
				result = psmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
			return result;
		}

	   public Customer selectCustomerInfo(String id){
			String sql = "SELECT id ,password   FROM customer where id = '"+id+"'";
			Customer cs = null;
			try {
				connect();
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				cs = new Customer();

				if(rs.next()) {
					cs.setId(rs.getString("id"));
					cs.setPassword(rs.getString("password"));
				}
				System.out.println(cs.toString());
				return cs;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				disconnect();
				
			}
			return cs;
			
			
		}
	   
}
