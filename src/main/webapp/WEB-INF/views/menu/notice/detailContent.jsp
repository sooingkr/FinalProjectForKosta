<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!------------------------------------- NOTICE 게시글 상세 보기 폼 --------------------------------------------->

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${cateDTO.cateName}</title>
	
</head>
<body class="index page-index">
	<!-- START NOTICE SECTION -->
	<div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;" >
		<!-- START HEADER -->
		<header class="site-header grey"> 
			<span class="nav-trigger">
			<span class="nav-trigger-inside"> 
			<span class="nav-trigger-line"></span></span>
		</span> <!-- START NAVIGATION MENU --> 
		<%@include file="/WEB-INF/views/layout/navigationImport.jsp"%>
		<!-- END NAVIGATION MENU --> <!-- START SOCIAL ICON --> 
		<%@include file="/WEB-INF/views/layout/socialIconImport.jsp"%>
		<!-- END SOCIAL ICON --> </header>
		<!-- END HEADER -->
		<section class="site-content full-height">
		<div class="content-frame">
			<div id="form-contact">
				<h1 id="hello">${cateDTO.cateName}</h1>
				<table class="table table-bordered">
					<tr>
						<th style="width: 20%">카테고리</th>
						<td >${cateDTO.cateName}<input type="hidden" name="bCategory" value="${boardDTO.cateId}" /></td>
						<th style="width: 20%">조회수</th>
						<td>${boardDTO.viewCnt }</td>
					</tr>
					<tr>
						<th style="width: 20%">작성일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardDTO.bRegDate }" /> </td>
						<th style="width: 20%">수정일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardDTO.bModifyDate }" /> </td>
					</tr>
					<tr>
						<th style="width: 20%">작성자</th>
						<td colspan="3">${boardDTO.userId}</td>
					</tr>
					<tr>
						<th style="width: 20%">제목</th>
						<td colspan="3">${boardDTO.bTitle}</td>
					</tr>
					<tr>
						<th style="width: 20%">내용</th>
						<td colspan="3"><pre style="height:500px;">${boardDTO.bContent}</pre></td>
					</tr>
				</table>
				<table align="right">
					<tr>
						<td>
							<button type="button" style="width:70px" onclick="location.href='/notice/updateContentForm?bNo=${boardDTO.bNo}'">글수정</button>
						</td>
						<td>
							&nbsp;<button style="width:70px" type="button" onclick="deleteContent()">글삭제</button>
						</td>
						<td align="right">
							&nbsp;<button type="button" style="width:70px" onclick="location.href='/notice/boardList?cateId=${cateDTO.cateId}'">목록</button>
						</td>
					</tr>
				</table>
				<br/><br/><br/><br/>
				
			</div>
		</div>
		</section>
		<script type="text/javascript">
		
			//게시글 삭제 버튼 클릭시
			function deleteContent(){
				if(confirm("정말 삭제하시겠습니까?")){
					location.href="/notice/deleteContentProc?bno=${boardDTO.bNo}&cateId=${cateDTO.cateId}";
				}else{
					return;
				} 
			}
			
		</script>
		<!-- 각 페이지별 메뉴 색깔 제어 -->
		<script>
			$(document).ready(function(){
				$("#talktous").attr("class","active");
			})
		</script>
	</div>
</body>
</html>