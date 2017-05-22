<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
	<!-- modal 제어 -->
	<%@include file="./includeModalCSS.jsp" %>
</head>
<body class="index page-index">

	<!-- START TEAM SECTION -->
	<div class="f-page gray-bkg" id="screen-team">
		<!-- START HEADER -->
		<header class="site-header grey">
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
		<section class="site-content full-height">
			<div class="content-frame">
				<div id="content-frame-mask1" style="right: 17px;"></div>
				<div class="what-row clearfix image-on-left">
					<div class="what-row clearfix image-on-right">
						<div>
							<!-- 쪽지쓰기 모달창 띄우기 -->
							<div class="panel">
								<a href="#login_form" id="login_pop">쪽지 쓰기</a>
							</div>

							<!-- popup form #1 -->
							<a href="#x" class="overlay" id="login_form"></a>
							<div class="popup">
								<h2>쪽지 쓰기</h2>
								<p>쪽지쓰기 창입니다.</p>
								<table width="800px" border="1" cellspacing="0" cellpadding="0">
									<form id="formName" action="/note/insertNote" method="post">
										<!-- 세션에서 id를 넣어 놓음(어차피 로그인한 사용자만 가능해야함): 로그인 기능 구현 전까지 임의로 입력해 놓겠음. -->
										<input type="hidden" name="userId" value="sooingkr" />
										<tr>
											<th><label for="login">받는 사람</label></th>
											<td><input style="width: 600px" type="text"
												name="recvId" value="${sendTo}" placeholder="받는 사람 id" autofocus="autofocus"/></td>
										</tr>
										<c:if test="${errors.ErecvId != null}">
											<tr>
												<th colspan="3"><b style="color: red;">${errors.ErecvId}</b></th>
											</tr>
										</c:if>
										<tr>
											<th><label for="login">제목</label></th>
											<td><input style="width: 600px" type="text"
												name="mtitle" placeholder="제목" value="${NoteVO.mtitle}" /></td>
										</tr>
										<c:if test="${errors.Etitle != null}">
											<tr>
												<th colspan="3"><b style="color: red;">${errors.Etitle}</b></th>
											</tr>
										</c:if>
										<tr>
											<th><label for="login">내용</label></th>
											<td><textarea rows="10" cols="100" name="mcontent">${NoteVO.mcontent}</textarea></td>
										</tr>
										<c:if test="${errors.Econtent != null}">
											<tr>
												<th colspan="3"><b style="color: red;">${errors.Econtent}</b></th>
											</tr>
										</c:if>
										<tr>
											<th colspan="2">
												<div class="btn-group" role="group" aria-label="...">
													<button id="sendBtn" type="button" class="btn btn-primary">보내기</button>
													<button id="cancelBtn" type="button" class="btn btn-danger">취소</button>
												</div>
											</th>
										</tr>
									</form>
								</table>
								<a class="close" href="#close"></a>
							</div>

						</div>
					</div>
				</div>
		</section>
		<div class="arrow"></div>
	</div>
	<!-- END TEAM SECTION -->
	<script>
		$(document).ready(function() {

			var formN = $("#formName");
			var Esize = $("#errors.errorSize");
			$("#sendBtn").on("click", function(event) {
				formN.submit();
			}); // end of sendBtn
			$("#cancelBtn").on("click", function(evnet) {
				history.back(); // 뒤로가기
			}); // end of cancelBtn
			
		})
	</script>
</body>
</html>
