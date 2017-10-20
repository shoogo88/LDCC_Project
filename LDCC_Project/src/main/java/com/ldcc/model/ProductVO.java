package com.ldcc.model;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {

	private String pId;
	private String pName;
	private String pPrice;
	private String pImagePath;
	private MultipartFile productPhoto;
	private String pExplain;
	private String registDate;
	private String using;
	private String modifyDate;
	public String getpId() {
		return pId;
	}
	public void setpId(String pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}
	public String getpImagePath() {
		return pImagePath;
	}
	public void setpImagePath(String pImagePath) {
		this.pImagePath = pImagePath;
	}
	public String getpExplain() {
		return pExplain;
	}
	public void setpExplain(String pExplain) {
		this.pExplain = pExplain;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getUsing() {
		return using;
	}
	public void setUsing(String using) {
		this.using = using;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public MultipartFile getProductPhoto() {
		return productPhoto;
	}
	
	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}
	
}
