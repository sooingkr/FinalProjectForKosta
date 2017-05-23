<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${cateDTO.cateName}</title>
</head>
<body class="index page-index">
	<!-- START TALK TO US SECTION -->
	<div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;" >
		<!-- START HEADER -->
		<header class="site-header yellow"> 
			<span class="nav-trigger">
			<span class="nav-trigger-inside"> 
			<span class="nav-trigger-line"></span></span></span> 
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
			<div id="form-contact">
				<h1 id="hello">${cateDTO.cateName}</h1>
				<form id="updateForm" action="/board/category/updateContentProc" method="post">
					<table class="table table-bordered">
						<tr>
							<th style="width: 20%">카테고리</th>
							<td>${cateDTO.cateName}<input type="hidden" name="cateId" value="${boardDTO.cateId}"/></td>
						</tr>
						<tr>
							<th style="width: 20%">작성자</th>
							<td>${boardDTO.userId}<input type="hidden" name="userId" value="${boardDTO.userId}"/></td>
						</tr>
						<tr>
							<th style="width: 20%">제목</th>
							<td><input id="bTitle" style="width: 100%; border: 0;" type="text" name="bTitle" value="${boardDTO.bTitle}" required="required"/></td>
						</tr>
						<tr>
							<th style="width: 20%">내용</th>
							<td><textarea id="bContent" name="bContent" rows="100" style="width: 100%; border: 0;" required="required">${boardDTO.bContent}</textarea></td>
						</tr>
						<tr>
							<th style="width: 20%">파일 업로드</th>
							<td><input style="width: 100%" type="file" /></td>
						</tr>
					</table>
					<table align="center">
					<tr><td>
						<input type="hidden" name="bNo" value="${boardDTO.bNo}" />
						<input type="submit" value="수정하기" />
						<button type="button" onclick="javascript:history.back();">취소</button>
					</td></tr>
					</table>
				</form>


			</div>
		</div>
	</section>
	<script type="text/javascript">
		/* function updateForm(){
			var cVal = document.getElementById("bContent").getAttribute('value');
			var tVal = document.getElementById("bTitle").getAttribute('value');
			if( cVal==null || tVal==null ){
				alert("제목과 내용은 필수 입력사항입니다.");
				return;
			}  
			var form = document.getElementById("updateForm");
			form.action="/category/updateContentProc";
			form.method="post";
			alert("게시글 수정이 완료되었습니다.");
			form.submit();
		} */
	</script>
	<script>
		$(document).ready(function(){
			$("#portfolio").attr("class","active");
		})
	</script>
</div>
</body>
</html>