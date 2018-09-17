package com.bean;

public class BuyedBooks {
	String bName;
	String bId;
	int bCount;
	double bPrice;
	
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public int getbCount() {
		return bCount;
	}
	public void setbCount(int bCount) {
		this.bCount = bCount;
	}
	public double getbPrice() {
		return bPrice;
	}
	public void setbPrice(double bPrice) {
		this.bPrice = bPrice;
	}
	@Override
	public String toString() {
		return "BuyedBooks [bName=" + bName + ", bId=" + bId + ", bCount=" + bCount + ", bPrice=" + bPrice + "]";
	}
	public BuyedBooks(String bId, String bName, int bCount, double bPrice) {
		super();
		this.bId = bId;
		this.bName = bName;
		this.bCount = bCount;
		this.bPrice = bPrice;
	}
	public BuyedBooks() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
