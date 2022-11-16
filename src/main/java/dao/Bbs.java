package dao;

import java.sql.Date;

public class Bbs { //게시글정보를 담을 수 있는 인스턴스를 만들기 위한 틀 . 데이터베이스와 비슷하여서 하나의 게시글을 처리할 수 있음
	
	private int customer_no; // 회원번호
	private String book_num; //isbn
	private String id; //
	private String review_contents; //리뷰내용
	private String title; //책제목
	private int review_rate; //리뷰 평점
	private String review_title; //리뷰제목
	private int review_num; //리뷰 글순서(?)
	private Date review_date; //리뷰작성날짜 
	
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getCustomer_no() {
		return customer_no;
	}
	public void setCustomer_no(int customer_no) {
		this.customer_no = customer_no;
	}
	public String getBook_num() {
		return book_num;
	}
	public void setBook_num(String book_num) {
		this.book_num = book_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public int getReview_rate() {
		return review_rate;
	}
	public void setReview_rate(int review_rate) {
		this.review_rate = review_rate;
	}
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

}
