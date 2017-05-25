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
				<form id="insertForm">
					<table class="table table-bordered">
						<tr>
							<th style="width:20%"> 카테고리</th>
							<td>${cateDTO.cateName}
								<input type="hidden" name="cateId" value="${cateDTO.cateId}"/></td>
						</tr>
						<tr>
							<th style="width:20%"> 작성자</th>
							<td>${loginSession.userId}
								<input style="width:100%; border:0;" type="hidden" id="userId" name="userId" value="${loginSession.userId}" required/></td>
						</tr>
						<tr>
							<th style="width:20%"> 제목</th>
							<td><input style="width:100%; border:0;" type="text" id="bTitle" name="bTitle" required/></td>
						</tr>
						<tr>
							<th style="width:20%"> 내용</th>
							<td><textarea style="width:100%; border: 0;" id = "bContent" name="bContent" rows="100" required></textarea></td>
						</tr>
						<tr>
							<th style="width:20%"> 상품가치</th>
							<td><input style="width:200px; text-align: right; " type="text" id="value" name="value" placeholder="숫자로 입력" required/> 원</td>
						</tr>
						<tr>
							<th style="width:20%"> 파일 업로드</th>
							<td><input style="width:100%" type="file" /></td>
						</tr>
					</table>
					<table align="center"><tr>
						<td><button type="button" onclick="checkInsert(); return false;">글쓰기</button></td>
						<td>&nbsp;&nbsp;<button type="button" onclick="javascript:history.back();">취소</button></td>
					</tr></table>
				</form>
			</div>
		</div>
	</section>	
	<script type="text/javascript">
		function checkInsert(){
			var form = document.getElementById("insertForm");	// form의 아이디
			var title = document.getElementById("bTitle").value;		// 제목	(빈 값 검사하기 위해)
			var content = document.getElementById("bContent").value;	// 내용
			var value = document.getElementById("value").value;		// 상품가치 (정규표현식을 위해 가져옴)
			
			if(title.trim() == "" || content.trim() == ""){		// trim() 앞,뒤 공백 제거
				alert("제목과 내용은 필수 입력사항입니다.");
				return;
			}
			
			var pattern = /^[0-9]*$/;	// 정규표현식 숫자만
			if(value.trim() == "" || !pattern.test(value)){
				alert("상품가치는 숫자만 입력 가능합니다.");
				return;
			}
			
			form.action="/board/category/writeBoardProc";
			form.method="post";
			alert("게시글 작성이 완료되었습니다.");
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