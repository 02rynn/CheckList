package dao;

public class cart {
	
	int CUSTOMER_NO ;
	String ID ;
	String isbn; 
	int shop_cnt;
	
	public int getCUSTOMER_NO() {
		return CUSTOMER_NO;
	}
	public void setCUSTOMER_NO(int cUSTOMER_NO) {
		CUSTOMER_NO = cUSTOMER_NO;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getShop_cnt() {
		return shop_cnt;
	}
	public void setShop_cnt(int shop_cnt) {
		this.shop_cnt = shop_cnt;
	}
}
