<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 찾기</title>

<script src="/resources/js/user/Pwselect.js"></script>

<!-- 
	@File name : selectPw.jsp
 	@author 김용래
  	@Desc 비밀번호찾기
 -->
 
</head>
<body class="index page-index">
	
	<!-- START TALK TO US SECTION -->
	<div class="f-page gray-bkg active" id="screen-about">
		<!-- START HEADER -->
		<header class="site-header grey"> <span class="nav-trigger">
			<span class="nav-trigger-inside"> <span
				class="nav-trigger-line"></span>
		</span>
		</span> <!-- START NAVIGATION MENU --> 
		<%@include file="/WEB-INF/views/layout/navigationImport.jsp"%>

		<!-- END NAVIGATION MENU --> <!-- START SOCIAL ICON --> 
		<%@include file="/WEB-INF/views/layout/socialIconImport.jsp"%>
		<!-- END SOCIAL ICON --> 
		</header>
		<!-- END HEADER -->

			<div id="form-contact">
				<h3 align = "center">
					<span class="glyphicon glyphicon-paperclip" style="color: #CC723D;">&nbsp;비밀번호 찾기</span>
				</h3>
				<br><br>

				<div class="col-md-6 col-md-offset-3">
					<div style="float: center; background-color: #EAE2D1; padding: 5% 7% 3% 7%; ;border-radius: 13px;">
						<form role="form" id="form1">
				            <div class="form-group">
				               <label class="control-label">아이디</label>
				                  <input type="text" class="form-control"id="userId" name="userId"  placeholder="아이디를 입력해주세요"
				                     value="" /> 
				            </div>
				            
				            <div class="form-group">
				               <label class="control-label">이름</label>
				                <input name="userName" type="text" class="form-control" id="userName" placeholder="이름을 입력해 주세요" 
				                value="">
				                <div id="name-error"></div>
				            </div>
				
				         <br/><br/>
				            <div class="form-group text-center">
				               <button id="cancelBtn" type="button" class="btn btn-default">취소</button> &nbsp;&nbsp;
				                <button id="select" type="button" class="btn btn-warning">찾기</button>
				            </div>
				         </form>
					</div>
				</div>
			</div>
	</div>
</body>
</html>