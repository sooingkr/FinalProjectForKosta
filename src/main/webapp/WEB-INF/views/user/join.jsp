<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원가입</title>
<!-- JQuery CDN -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="/resources/js/join/join.js"></script>

<!-- 
	@File name : join.jsp
 	@author Areum, 황영롱(다음 주소 api -> 네이버 주소->위도,경도 연동)
  	@Desc 회원가입 form
 -->
 
</head>
<body>

   <article class="container">
      <div class="page-header">
         <h1>회원가입 </h1>
      </div>
      <div class="col-md-6 col-md-offset-3" style="position: static;">
         <form role="form" id="form1">
            <div class="form-group">
               <label class="control-label">아이디</label>
               <div class="input-group">
                  <input type="text" class="form-control"id="userId" name="userId"  placeholder="아이디를 입력해주세요"
                  	value="${UserVO.userId}"/> 
                  <span class="input-group-btn">
                     <input type="button" class="btn btn-warning" id="idcheck" value="중복체크" onclick="idCheck();"/>
                  </span>
               </div>
               <div id="idchk-error"></div>
            </div>
            
               
 
            <div class="form-group">
               <label class="control-label">비밀번호 </label>
               <input type="password" class="form-control" id="pw" name="userPw"  placeholder="영문,숫자 조합해 6~15자이내 입력해주세요">
               <div id="pw-error"></div>
            </div>
            
            
            <div class="form-group">
               <label class="control-label">비밀번호 확인 </label>
               <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
               <div id="pw2-error"></div>
            </div>
            
            
            <div class="form-group">
               <label class="control-label">이름</label>
                <input name="userName" type="text" class="form-control" id="userName" placeholder="이름을 입력해 주세요" 
                value="${UserVO.userName}">
                <div id="name-error"></div>
            </div>
            
            
            <div class="form-group">
               <label class="control-label">휴대폰 번호 </label>
               <input type="text" class="form-control" id="userHp" name="userHp"  placeholder="-를 제외하고 숫자만 입력하세요">
               <div id="hp-error"></div>
            </div>
            
            
            <div class="form-group">
               <label class="control-label">이메일  </label>
               <input type="email" class="form-control" id="userEmail" name="userEmail"  placeholder="이메일을 입력해주세요"
                 value="${UserVO.email}"> 
               <div id="email-error"></div>
            </div>
            
            
            
            <div class="form-group">
            <label class="control-label">우편번호 </label>
               <div class="input-group">
                  <input type="text" id="sample6_postcode" class="form-control" readonly>
                  <span class="input-group-btn">
                     <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-warning" value="우편번호 검색">
                  </span>
               </div>
            </div>
            
            
         <div class="form-group">
            <label class="control-label">상세주소 </label>
            <input type="text" id="addr1" name="addr1" class="d_form large form-control" readonly>
            <input type="text" id="addr2" name="addr2" class="form-control" placeholder="상세주소를 입력하세요.">
         	<input type="number" id="latId" name="lat"/>
         	<input type="number" id="lonId" name="lon"/>
         </div>

      <div class="form-group">
         <label class="control-label">관심분야 </label> 
         <div class="input-group">
            <label class="checkbox-inline"> 
               <input type="checkbox" name="checkbox" id="cateId1" value="n">유아/취미/완구
            </label> 
            <label class="checkbox-inline"> 
               <input type="checkbox" name="checkbox" id="cateId2" value="n">뷰티/패션/잡화
            </label> 
            <label class="checkbox-inline"> 
               <input type="checkbox" name="checkbox" id="cateId3" value="n">애완동물 용품
            </label> 
            
            <br/><br/>
            
            <label class="checkbox-inline"> 
               <input type="checkbox" name="checkbox" id="cateId4" value="n">홈인테리어/주방용품/생활용품   
            </label> 
            <label class="checkbox-inline"> 
               <input type="checkbox" name="checkbox" id="cateId5" value="n">도서/음반
            </label> 
            <label class="checkbox-inline"> 
               <input type="checkbox" name="checkbox" id="cateId6" value="n">지역 할인 쿠폰
            </label>
            
             <input type="hidden" name="uniqId" value="${UserVO.uniqId}" id="uniqId">
         </div>
      </div>

         <br/><br/>
            <div class="form-group text-center">
               <button id="cancelBtn" type="button" class="btn btn-default">가입취소</button> &nbsp;&nbsp;
                <button id="joinbtn" type="button" class="btn btn-success">회원가입</button>
                
                <input name="idCheckboolean" id="idCheckboolean" type="hidden" value="n"> <%--아이디를 제대로 체크했고 중복됬는지 체크 --%>
            
            </div>
         </form>
      </div>
   </article>
</body>
</html>