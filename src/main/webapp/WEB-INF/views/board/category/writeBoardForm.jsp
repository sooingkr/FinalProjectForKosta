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
				<form action="/board/category/writeBoardProc" method="post">
					<table class="table table-bordered">
						<tr>
							<th style="width:20%"> 카테고리</th>
							<td>${cateDTO.cateName}
								<input type="hidden" name="cateId" value="${cateDTO.cateId}"/></td>
						</tr>
						<tr>
							<th style="width:20%"> 작성자</th>
							<td><input style="width:100%; border:0;" type="text" name="userId" required/></td>
						</tr>
						<tr>
							<th style="width:20%"> 제목</th>
							<td><input style="width:100%; border:0;" type="text" name="bTitle" required/></td>
						</tr>
						<tr>
							<th style="width:20%"> 내용</th>
							<td><textarea name="bContent" rows="100" style="width:100%; border: 0;" required></textarea></td>
						</tr>
						<tr>
							<th style="width:20%"> 상품가치</th>
							<td><input style="width:200px; text-align: right; " type="text" name="value" required/> 원</td>
						</tr>
						<tr>
							<th style="width:20%"> 파일 업로드</th>
							<td><input style="width:100%" type="file" /></td>
						</tr>
					</table>
					<table align="center"><tr>
						<td><input type="submit" value="글쓰기" /></td>
						<td>&nbsp;&nbsp;<button type="button" onclick="javascript:history.back();">취소</button></td>
					</tr></table>
				</form>
			</div>
		</div>
	</section>	
	<!-- <script type="text/javascript">
		function checkInsert(){
			var form = document.getElementById("insertForm");
			form.action="/category/writeBoardProc";
			form.method="post";
			alert("게시글 작성이 완료되었습니다.");
			form.submit();
		}
	</script> -->	
	<script>
		$(document).ready(function(){
			$("#portfolio").attr("class","active");
		})
	</script>		
</div>		
</body>
</html>