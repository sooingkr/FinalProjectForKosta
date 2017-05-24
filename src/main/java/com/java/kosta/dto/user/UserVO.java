package com.java.kosta.dto.user;

import java.sql.Date;

// 사용자 관련 정보 VO 클래스
public class UserVO {

	private String userId;
	private String userName;
	private String userPw;
	private String userHp;
	private String userEmail;
	private String addr1;
	private String addr2;
	private String interestId;
	private String sessionKey;
	private Date sessionLimit; // 쿠키유지
	private Date userRegdate; // 회원 등록일
	private boolean useCookie; // 쿠키 사용여부
	private String lat;
	private String lon;
	private String cateId;

	public String getCateId() {
		return cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
	}

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

	//
	private String cateId1;
	private String cateId2;
	private String cateId3;
	private String cateId4;
	private String cateId5;
	private String cateId6;
	private String cateId7;
	//

	public String getCateId1() {
		return cateId1;
	}

	public void setCateId1(String cateId1) {
		this.cateId1 = cateId1;
	}

	public String getCateId2() {
		return cateId2;
	}

	public void setCateId2(String cateId2) {
		this.cateId2 = cateId2;
	}

	public String getCateId3() {
		return cateId3;
	}

	public void setCateId3(String cateId3) {
		this.cateId3 = cateId3;
	}

	public String getCateId4() {
		return cateId4;
	}

	public void setCateId4(String cateId4) {
		this.cateId4 = cateId4;
	}

	public String getCateId5() {
		return cateId5;
	}

	public void setCateId5(String cateId5) {
		this.cateId5 = cateId5;
	}

	public String getCateId6() {
		return cateId6;
	}

	public void setCateId6(String cateId6) {
		this.cateId6 = cateId6;
	}

	public String getCateId7() {
		return cateId7;
	}

	public void setCateId7(String cateId7) {
		this.cateId7 = cateId7;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserHp() {
		return userHp;
	}

	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getInterestId() {
		return interestId;
	}

	public void setInterestId(String interestId) {
		this.interestId = interestId;
	}

	public String getSessionKey() {
		return sessionKey;
	}

	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}

	public Date getSessionLimit() {
		return sessionLimit;
	}

	public void setSessionLimit(Date sessionLimit) {
		this.sessionLimit = sessionLimit;
	}

	public Date getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(Date userRegdate) {
		this.userRegdate = userRegdate;
	}

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

}