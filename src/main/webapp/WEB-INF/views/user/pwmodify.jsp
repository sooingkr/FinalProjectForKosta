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
<script src="/resources/js/user/pwmodify.js"></script>

<!-- 
	@File name : pwmodify.jsp
 	@author 김용래
  	@Desc 비밀번호수정
 -->
 
</head>
<body>

   <article class="container">
      <div class="page-header">
         <h1>비밀번호 찾기 </h1>
      </div>
      <div class="col-md-6 col-md-offset-3" style="position: static;">
         <form role="form" id="form1">
            <div class="form-group">
            
               <label class="control-label">아이디</label>
                  <input type="text" class="form-control"id="userId" name="userId"  placeholder="아이디를 입력해주세요"
                  	value="${id}" readonly="readonly" /> 
            </div>
            
                <div class="form-group">
               <label class="control-label">변경할 비밀번호 </label>
               <input type="password" class="form-control" id="pw" name="userPw"  placeholder="영문,숫자 조합해 6~15자이내 입력해주세요">
               <div id="pw-error"></div>
            </div>
            
            
            <div class="form-group">
               <label class="control-label">변경할 비밀번호 확인 </label>
               <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
               <div id="pw2-error"></div>
            </div>
            

         <br/><br/>
            <div class="form-group text-center">
               <button id="cancelBtn" type="button" class="btn btn-default">취소</button> &nbsp;&nbsp;
                <button id="select" type="button" class="btn btn-success">수정하기</button>
                
            </div>
            
         </form>
         
      </div>
   </article>
</body>
</html>