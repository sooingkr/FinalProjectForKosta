<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Welcome Linket</title>


<!-- START WELCOME SECTION -->
<div class="f-page yellow-bkg active" id="screen-welcome">
	<div id="debugger"></div>
	<!-- PRELOADER -->
	<div id="content-loader-holder">
		<div id="content-loader">
			<div class="ss-preloader-spin"></div>
		</div>
	</div>
	<!-- END PRELOADER -->
	<div class="g-screen fixed-screen">
		<!-- START HEADER -->
		<header class="site-header yellow">
			<span class="nav-trigger"> <span class="nav-trigger-inside">
					<span class="nav-trigger-line"></span>
			</span>
			</span>
			<!-- START NAVIGATION MENU -->
			<%@include file="/WEB-INF/views/layout/navigationImport.jsp"%>
			<!-- END NAVIGATION MENU -->

			<!-- START SOCIAL ICON -->
			<%@include file="/WEB-INF/views/layout/socialIconImport.jsp"%>
			<!-- END SOCIAL ICON -->

		</header>
		<!-- END HEADER -->
		<!-- START LOGO -->
		<div class="main-logo">
			<div class="main-logo-shadow"></div>
			<div class="logo-img"></div>
			<div class="logo-arrow">
				<button type="button" class="btn btn-lg login" data-toggle="modal" data-target="#loginModal">회원 로그인</button>
				<br /><br />
				<button type="button" class="btn btn-lg googleLogin" onclick="javascript:location.href='/api/google'"></button>
			</div>
		</div>


		<!-- Modal -->
		<div class="modal fade" id="loginModal" role="dialog">
			<div class="modal-dialog">
				<form class="form center-block" action="/login/loginProc"
					method="post">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h1 class="text-center">Login</h1>
						</div>

						<div class="modal-body">
							<div class="form-group">
								<input type="text" class="form-control input-lg" placeholder="ID" id="userId" name="userId">
							</div>
							<div class="form-group">
								<input type="password" class="form-control input-lg" placeholder="Password" id="userPw" name="userPw">
							</div>
							<div class="form-group form col-md-12">
								<span><a href="/user/Idselect">아이디찾기</a></span> / <span>
								<a href="/user/Pwselect">비밀번호찾기</a></span>
							</div>
						</div>
						<br />
						<div class="modal-footer">
							<div class="col-md-12">
								<button type="button" onclick="javascript:location.href='/user/subscribeJoin'" class="btn btn-info">회원가입</button>
								<input type="button" class="btn btn-warning" id="login" value="로그인" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- END LOGO -->

		<!-- START FLUBBER -->
		<div class="flubber">
			<div id="flubber" class="flubber-guy">
				<div class="flubber-eyes"></div>
			</div>
			<ul class="flubber-quote">
				<li>안녕하세요. 반갑습니다.</li>
				<li>kosta에서하는 마지막 프로젝트입니다.</li>
				<li>다들 조금만 더 힘냅시다. 화이팅!</li>
			</ul>
		</div>
		<!-- END FLUBBER -->
		<div class="main-quote">" FAILURE IS NOT AN OPTION, IT IS A
			REQUIREMENT "</div>
	</div>
</div>


<script>
	$(document).ready(function(){
		$("#welcome").attr("class","active");
	})
</script>
