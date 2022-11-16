package dao;
import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class BookDao {

	public  ArrayList<Book> getAladinItemList(String type) {// type에 따라서 알라딘 api 에서 책 리스트를 가지고 오는 메소드

		String jsonStr = "";
		ArrayList<Book> asd = null;
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://www.aladin.co.kr/ttb/api/ItemList.aspx"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("ttbkey", "UTF-8")
					+ "=ttbzxzx050501758001"); /*
																																 * Service
																																 * Key
																																 */
		
			urlBuilder.append("&" + URLEncoder.encode("QueryType", "UTF-8") + "="
					+ URLEncoder.encode( type, "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("MaxResults", "UTF-8") + "="
					+ URLEncoder.encode("20", "UTF-8")); /* 한글 국가명 */
			urlBuilder.append("&" + URLEncoder.encode("start", "UTF-8") + "="
					+ URLEncoder.encode("1", "UTF-8")); /* ISO 2자리코드 */
			urlBuilder.append("&" + URLEncoder.encode("SearchTarget", "UTF-8") + "="
					+ URLEncoder.encode("Book", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("output", "UTF-8") + "="
					+ URLEncoder.encode("js", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("Version", "UTF-8") + "="
					+ URLEncoder.encode("20131101", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("Cover", "UTF-8") + "="
					+ URLEncoder.encode("Big", "UTF-8"));
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println("Response code: " + conn.getResponseCode());
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
			jsonStr = sb.toString();
			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStr);

			
			JSONArray jsonapiObj = (JSONArray) jsonObject.get("item");
			asd = new ArrayList<Book>();
			for(int i = 0 ; i < jsonapiObj.size();i++) {
				JSONObject jsonO2ject = (JSONObject)jsonapiObj.get(i);
				
				Book asd1 = new Book();
				asd1.setThumbnail((String)jsonO2ject.get("cover"));
				asd1.setIsbn((String)jsonO2ject.get("isbn"));
				asd.add(asd1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	
		return asd;

	}
	public ArrayList<Book> getAladinItemList_ItemEditorChoice() { // editor 추천 책 리스트를 가지고 오는 메소트 

		String jsonStr = "";
		ArrayList<Book> arr = null;
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://www.aladin.co.kr/ttb/api/ItemList.aspx"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("ttbkey", "UTF-8")
					+ "=ttbzxzx050501758001"); /*
																																 * Service
																																 * Key
																																 */
		
			urlBuilder.append("&" + URLEncoder.encode("QueryType", "UTF-8") + "="
					+ URLEncoder.encode("BlogBest", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("MaxResults", "UTF-8") + "="
					+ URLEncoder.encode("20", "UTF-8")); /* 한글 국가명 */
			urlBuilder.append("&" + URLEncoder.encode("start", "UTF-8") + "="
					+ URLEncoder.encode("1", "UTF-8")); /* ISO 2자리코드 */
			urlBuilder.append("&" + URLEncoder.encode("SearchTarget", "UTF-8") + "="
					+ URLEncoder.encode("Book", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("output", "UTF-8") + "="
					+ URLEncoder.encode("js", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("Version", "UTF-8") + "="
					+ URLEncoder.encode("20131101", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("Cover", "UTF-8") + "="
					+ URLEncoder.encode("Big", "UTF-8"));
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println("Response code: " + conn.getResponseCode());
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
			jsonStr = sb.toString();
			JSONParser jsonParser = new JSONParser();

			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStr);
			
			;
			JSONArray jsonapiObj = (JSONArray) jsonObject.get("item");
			System.out.println(jsonapiObj);
			arr = new ArrayList<Book>();
			for(int i = 0 ; i < jsonapiObj.size();i++) {
				JSONObject jsonO2ject = (JSONObject)jsonapiObj.get(i);
				
				Book asd1 = new Book();
				asd1.setThumbnail((String)jsonO2ject.get("cover"));
				asd1.setTitle((String)jsonO2ject.get("title"));
				asd1.setContent((String)jsonO2ject.get("description"));
				arr.add(asd1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	

		return arr;

	}
	
	public JSONObject getAladinItemForDetail(String isbn) { //isbn에 따라 api에서 값을 가지고오는 메소드

		String jsonStr = "";
		ArrayList<Book> arr = null;
		JSONObject jsonObject22 = null;
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("ttbkey", "UTF-8")
					+ "=ttbzxzx050501758001"); /*
																																 * Service
																																 * Key
																																 */
			urlBuilder.append("&" + URLEncoder.encode("Cover", "UTF-8") + "="
					+ URLEncoder.encode("Big", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("itemIdType", "UTF-8") + "="
					+ URLEncoder.encode("isbn", "UTF-8")); /* 한글 국가명 */
			urlBuilder.append("&" + URLEncoder.encode("ItemId", "UTF-8") + "="
					+ URLEncoder.encode( isbn , "UTF-8")); /* ISO 2자리코드 */
			urlBuilder.append("&" + URLEncoder.encode("output", "UTF-8") + "="
					+ URLEncoder.encode("js", "UTF-8"));
			
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
//			System.out.println("Response code: " + conn.getResponseCode());
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
			jsonStr = sb.toString();
			JSONParser jsonParser = new JSONParser();
			jsonStr = jsonStr.replaceAll(";", "");
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStr);
			
			;
			JSONArray jsonapiObj = (JSONArray) jsonObject.get("item");
			
			jsonObject22 = (JSONObject)jsonapiObj.get(0);
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	

		
		return jsonObject22;

	}
	

}
