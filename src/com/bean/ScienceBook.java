package com.bean;

import org.springframework.stereotype.Component;

@Component
public class ScienceBook {
    int scienceId;
	
	String scienceName;
	
	double sciencePrice;
	
	int scienceStore;
	
	String scienceType;
	
	String scienceUrl;
	
	//int mId;
	
	String scienceAuthor;
	
	String sciencePress;
	String sciencePublicationDate;
	String sciencePage;
	String scienceISBN;
	public int getScienceId() {
		return scienceId;
	}
	public void setScienceId(int scienceId) {
		this.scienceId = scienceId;
	}
	public String getScienceName() {
		return scienceName;
	}
	public void setScienceName(String scienceName) {
		this.scienceName = scienceName;
	}
	public double getSciencePrice() {
		return sciencePrice;
	}
	public void setSciencePrice(double sciencePrice) {
		this.sciencePrice = sciencePrice;
	}
	public int getScienceStore() {
		return scienceStore;
	}
	public void setScienceStore(int scienceStore) {
		this.scienceStore = scienceStore;
	}
	public String getScienceType() {
		return scienceType;
	}
	public void setScienceType(String scienceType) {
		this.scienceType = scienceType;
	}
	public String getScienceUrl() {
		return scienceUrl;
	}
	public void setScienceUrl(String scienceUrl) {
		this.scienceUrl = scienceUrl;
	}
	public String getScienceAuthor() {
		return scienceAuthor;
	}
	public void setScienceAuthor(String scienceAuthor) {
		this.scienceAuthor = scienceAuthor;
	}
	public String getSciencePress() {
		return sciencePress;
	}
	public void setSciencePress(String sciencePress) {
		this.sciencePress = sciencePress;
	}
	public String getSciencePublicationDate() {
		return sciencePublicationDate;
	}
	public void setSciencePublicationDate(String sciencePublicationDate) {
		this.sciencePublicationDate = sciencePublicationDate;
	}
	public String getSciencePage() {
		return sciencePage;
	}
	public void setSciencePage(String sciencePage) {
		this.sciencePage = sciencePage;
	}
	public String getScienceISBN() {
		return scienceISBN;
	}
	public void setScienceISBN(String scienceISBN) {
		this.scienceISBN = scienceISBN;
	}
	public ScienceBook(int scienceId, String scienceName, double sciencePrice, int scienceStore, String scienceType,
			String scienceUrl, String scienceAuthor, String sciencePress, String sciencePublicationDate,
			String sciencePage, String scienceISBN) {
		super();
		this.scienceId = scienceId;
		this.scienceName = scienceName;
		this.sciencePrice = sciencePrice;
		this.scienceStore = scienceStore;
		this.scienceType = scienceType;
		this.scienceUrl = scienceUrl;
		this.scienceAuthor = scienceAuthor;
		this.sciencePress = sciencePress;
		this.sciencePublicationDate = sciencePublicationDate;
		this.sciencePage = sciencePage;
		this.scienceISBN = scienceISBN;
	}
	@Override
	public String toString() {
		return "ScienceBook [scienceId=" + scienceId + ", scienceName=" + scienceName + ", sciencePrice=" + sciencePrice
				+ ", scienceStore=" + scienceStore + ", scienceType=" + scienceType + ", scienceUrl=" + scienceUrl
				+ ", scienceAuthor=" + scienceAuthor + ", sciencePress=" + sciencePress + ", sciencePublicationDate="
				+ sciencePublicationDate + ", sciencePage=" + sciencePage + ", scienceISBN=" + scienceISBN + "]";
	}
	public ScienceBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
