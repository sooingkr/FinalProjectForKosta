package com.java.kosta.dto.board;

import java.util.Date;

public class BoardDTO {
	String bNo;		//게시판 번호
	String userId;	//작성자 id
	int cateId;	//카테고리 id
	String bTitle;	//제목
	String bContent;	//내용
	String value;		//티켓의 가치
	String isSwap;		// ENUM('Y','N')
	String viewCnt;		//조회수
	Date bRegDate;	//게시 날짜
	Date bModifyDate;	//수정 날짜
	private String lat; // 위도
	private String lon; // 경도
	
	private String imgPath[];
	private String imgOriginName[];
	private String imgSize[];
	
	private String filePath[];
	private String fileOriginName[];
	private String fileSize[];
	
//	private String[] files;	// 파일 업로드 배열
	
	
	public String[] getImgPath() {
		return imgPath;
	}
	public String[] getImgOriginName() {
		return imgOriginName;
	}
	public String[] getImgSize() {
		return imgSize;
	}
	public String[] getFilePath() {
		return filePath;
	}
	public String[] getFileOriginName() {
		return fileOriginName;
	}
	public String[] getFileSize() {
		return fileSize;
	}
	public void setImgPath(String[] imgPath) {
		this.imgPath = imgPath;
	}
	public void setImgOriginName(String[] imgOriginName) {
		this.imgOriginName = imgOriginName;
	}
	public void setImgSize(String[] imgSize) {
		this.imgSize = imgSize;
	}
	public void setFilePath(String[] filePath) {
		this.filePath = filePath;
	}
	public void setFileOriginName(String[] fileOriginName) {
		this.fileOriginName = fileOriginName;
	}
	public void setFileSize(String[] fileSize) {
		this.fileSize = fileSize;
	}
	/*public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	*/
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLon() {
		return lon;
	}
	public void setLon(String lon) {
		this.lon = lon;
	}
	public String getbNo() {
		return bNo;
	}
	public String getUserId() {
		return userId;
	}
	public int getCateId() {
		return cateId;
	}
	public String getbTitle() {
		return bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public String getValue() {
		return value;
	}
	public String getIsSwap() {
		return isSwap;
	}
	public String getViewCnt() {
		return viewCnt;
	}
	public Date getbRegDate() {
		return bRegDate;
	}
	public Date getbModifyDate() {
		return bModifyDate;
	}
	public void setbNo(String bNo) {
		this.bNo = bNo;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setCateId(int cateId) {
		this.cateId = cateId;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public void setIsSwap(String isSwap) {
		this.isSwap = isSwap;
	}
	public void setViewCnt(String viewCnt) {
		this.viewCnt = viewCnt;
	}
	public void setbRegDate(Date bRegDate) {
		this.bRegDate = bRegDate;
	}
	public void setbModifyDate(Date bModifyDate) {
		this.bModifyDate = bModifyDate;
	}
}
