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