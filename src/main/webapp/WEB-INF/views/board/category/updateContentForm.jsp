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
		<header class="site-header grey"> 
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
				<form id="updateForm">
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
							<th style="width:20%"> 상품가치</th>
							<td><input style="width:200px; text-align: right; " type="text" id="value" name="value"  value="${boardDTO.value}" required placeholder="숫자로 입력"/> 원</td>
						</tr>
						<tr>
							<th style="width: 20%">파일 업로드</th>
							<td><input style="width: 100%" type="file" /></td>
						</tr>
					</table>
					<table align="center">
					<tr><td>
						<input type="hidden" name="bNo" value="${boardDTO.bNo}" />
						<button type="button" onclick="checkUpdate();" >수정하기</button>
						<button type="button" onclick="javascript:history.back();">취소</button>
					</td></tr>
					</table>
				</form>


			</div>
		</div>
	</section>
	<script type="text/javascript">
		/* validation 사용해서 검사해야함.... */
		function checkUpdate(){
			var form = document.getElementById("updateForm");
			var content = document.getElementById("bContent").value;
			var title = document.getElementById("bTitle").value;
			var value = document.getElementById("value").value;		// 상품가치 (정규표현식을 위해 가져옴)
			
			if( content.trim() == "" || title.trim() == "" ){
				alert("제목과 내용은 필수 입력사항입니다.");
				return;
			}
			var pattern = /^[0-9]*$/;	// 정규표현식 숫자만
			if(value.trim() == "" || !pattern.test(value)){
				alert("상품가치는 숫자만 입력 가능합니다.");
				return;
			}
			form.action="/board/category/updateContentProc";
			form.method="post";
			alert("게시글 수정이 완료되었습니다.");
			form.submit();
		} 
	</script>
	<script>
		$(document).ready(function(){
			$("#portfolio").attr("class","active");
		})
	</script>
</div>
</body>
</html>