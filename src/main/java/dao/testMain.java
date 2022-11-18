package dao;

import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class testMain {
	
	
	
		public static String getAladinItem() {

			
			String jsonStr = "";
			

			try {
				StringBuilder urlBuilder = new StringBuilder(
						" http://www.aladin.co.kr/ttb/api/ItemList.aspx"); /* URL */
				urlBuilder.append("?" + URLEncoder.encode("ttbkey", "UTF-8")
						+ "=ttbzxzx050501758001"); 																																														 
//				urlBuilder.append("&" + URLEncoder.encode("Query", "UTF-8") + "="
//						+ URLEncoder.encode("소설", "UTF-8")); /* XML 또는 JSON */
				urlBuilder.append("&" + URLEncoder.encode("QueryType", "UTF-8") + "="
						+ URLEncoder.encode("Bestseller", "UTF-8")); /* 한 페이지 결과 수 */
				urlBuilder.append("&" + URLEncoder.encode("MaxResults", "UTF-8") + "="
						+ URLEncoder.encode("100", "UTF-8")); /* 한글 국가명 */
				urlBuilder.append("&" + URLEncoder.encode("start", "UTF-8") + "="
						+ URLEncoder.encode("10", "UTF-8")); /* ISO 2자리코드 */
				urlBuilder.append("&" + URLEncoder.encode("SearchTarget", "UTF-8") + "="
						+ URLEncoder.encode("Book", "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("output", "UTF-8") + "="
						+ URLEncoder.encode("js", "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("Version", "UTF-8") + "="
						+ URLEncoder.encode("20131101", "UTF-8"));
				urlBuilder.append("&" + URLEncoder.encode("cover", "UTF-8") + "="
						+ URLEncoder.encode("Big", "UTF-8"));
				URL url = new URL(urlBuilder.toString());
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET"); 
				conn.setRequestProperty("Content-type", "application/json");
//				System.out.println("Response code: " + conn.getResponseCode());
				BufferedReader rd;
				if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
					rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
				} else {
					rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
				}
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = rd.readLine()) != null) {
					sb.append(line);
				}
				rd.close();
				conn.disconnect();
//				System.out.println(sb.toString());
				jsonStr = sb.toString();
			} catch (Exception e) {
				e.printStackTrace();
			}

			return jsonStr;
	
		}
		

		public static void main(String[] args) {
			

	CustomerDao dao = new CustomerDao();
	
	
	System.out.println(dao.selectCustomerInfo("asd").getId());
	System.out.println(dao.selectCustomerInfo("asd").getPassword());
			
			DataDao dao=new DataDao(); 
			
			List<Book> bk = dao.selectBuyBookInfo("bkw");
			System.out.println(bk.size());
			
			

//			System.out.println(dao.getAladinItemList("ItemNewAll").size());
//			System.out.println(dao.getAladinItemList_ItemEditorChoice().size());
			
			


//			DataDao  dao = new DataDao();
//			
//
//			try {
//				JSONParser jsonParser = new JSONParser();
//
//				JSONObject jsonObject = (JSONObject) jsonParser.parse(getAladinItem());
//
//				JSONArray itemArr = (JSONArray) jsonObject.get("item");
//				//item 객체가 배열로 들어옴 
//				ArrayList<Book> bookList = new ArrayList<Book>();
//
//				
//				for(int i = 0 ; i < itemArr.size();i++) {
//					
//					JSONObject target = (JSONObject)itemArr.get(i); //배열을 하나씩  target에 저장하고
//					
//					Book bk = new Book(); //객체를 새로 만들어서 
//					
//					bk.setAuthors((String)target.get("author"));
//					bk.setContent((String)target.get("description"));
//					bk.setDate_time((String)target.get("pubDate"));
//					bk.setIsbn((String)target.get("isbn"));
//					bk.setPrice(Integer.parseInt(target.get("priceSales").toString()));
//					bk.setStatus((String)target.get("stockStatus"));
//					bk.setCategory_name(target.get("categoryName").toString());
//					bk.setThumbnail((String)target.get("cover"));
//					bk.setTitle ((String)target.get("title")); //book에다가 set해서 데이터 넣어줌 
//					
//					bookList.add(bk); //넣어준 book객체를 다시 리스트에 넣어줌 
//					//System.out.println(bookList);
//				}
//				
//				dao.insert_book_info( bookList); //리스트를 메소드에 보냄 
//				
//
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			DataDao dao = new DataDao();
//			
//			String name = "asd";
//			List<Book> asd = dao.selectBuyBookList(name);
//			
//	
//			System.out.println(asd.get(0).getTitle());
			
			
			
			

		}
		


}
