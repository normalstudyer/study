package com.bean;

import org.springframework.stereotype.Component;

@Component
public class Product {
	
	int pId;
	
	String pName;
	
	double pPrice;
	
	int pStore;
	
	String caType;
	
	String pUrl;
	
	int mId;
	
	String pAuthor;
	
	String pPress;
	String pPublicationDate;
	String pPage;
	String pISBN;
	public String getpPress() {
		return pPress;
	}
	public void setpPress(String pPress) {
		this.pPress = pPress;
	}
	public String getpPublicationDate() {
		return pPublicationDate;
	}
	public void setpPublicationDate(String pPublicationDate) {
		this.pPublicationDate = pPublicationDate;
	}
	public String getpPage() {
		return pPage;
	}
	public void setpPage(String pPage) {
		this.pPage = pPage;
	}
	public String getpISBN() {
		return pISBN;
	}
	public void setpISBN(String pISBN) {
		this.pISBN = pISBN;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public double getpPrice() {
		return pPrice;
	}
	public void setpPrice(double pPrice) {
		this.pPrice = pPrice;
	}
	public int getpStore() {
		return pStore;
	}
	public void setpStore(int pStore) {
		this.pStore = pStore;
	}
	public String getCaType() {
		return caType;
	}
	public void setCaType(String caType) {
		this.caType = caType;
	}
	public String getpUrl() {
		return pUrl;
	}
	public void setpUrl(String pUrl) {
		this.pUrl = pUrl;
	}
	
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getpAuthor() {
		return pAuthor;
	}
	public void setpAuthor(String pAuthor) {
		this.pAuthor = pAuthor;
	}
	public Product() {
		super();
	}
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pPrice=" + pPrice + ", pStore=" + pStore + ", caType="
				+ caType + ", pUrl=" + pUrl + ", mId=" + mId + ", pAuthor=" + pAuthor + ", pPress=" + pPress
				+ ", pPublicationDate=" + pPublicationDate + ", pPage=" + pPage + ", pISBN=" + pISBN + "]";
	}
	public Product(int pId, String pName, double pPrice, int pStore, String caType, String pUrl, int mId,
			String pAuthor, String pPress, String pPublicationDate, String pPage, String pISBN) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pStore = pStore;
		this.caType = caType;
		this.pUrl = pUrl;
		this.mId = mId;
		this.pAuthor = pAuthor;
		this.pPress = pPress;
		this.pPublicationDate = pPublicationDate;
		this.pPage = pPage;
		this.pISBN = pISBN;
	}
	
	
}
