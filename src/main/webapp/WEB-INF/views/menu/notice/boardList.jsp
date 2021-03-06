<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!------------------------------------- NOTICE 게시판 리스트 폼 --------------------------------------------->

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>${cateDTO.cateName}</title>
</head>
<body class="index page-index">
	
	<!-- START NOTICE BOARD SECTION -->
	<div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;" >
		<!-- START HEADER -->
		<header class="site-header grey"> <span class="nav-trigger">
			<span class="nav-trigger-inside"> <span
				class="nav-trigger-line"></span>
		</span>
		</span> <!-- START NAVIGATION MENU --> <%@include
			file="/WEB-INF/views/layout/navigationImport.jsp"%>

		<!-- END NAVIGATION MENU --> <!-- START SOCIAL ICON --> <%@include
			file="/WEB-INF/views/layout/socialIconImport.jsp"%>
		<!-- END SOCIAL ICON --> 
		</header>
		<!-- END HEADER -->
		<section class="site-content full-height">
		<div class="content-frame">
			<div id="form-contact">
				<h2><span class="glyphicon glyphicon-volume-up" style="color: #CC723D;">&nbsp;${cateDTO.cateName}</span></h2>
				<form action="/notice/boardList" >
				<table align="right">
				<tr>
					<td>
						<select name="searchType" class="form-control col-md-3">
							<option value="titleContent"
								<c:if test="${pagingDTO.searchType eq 'titleContent'}" > selected="selected" </c:if>>제목+내용</option>
							<option value="writer"
								<c:if test="${pagingDTO.searchType eq 'writer'}" > selected="selected" </c:if>>글쓴이</option>
							<option value="title"
								<c:if test="${pagingDTO.searchType eq 'title'}" > selected="selected" </c:if>>제목</option>
						</select> 
					</td>
					<td>&nbsp;&nbsp;</td>
					<td>
						<div class="input-group" >
							<input style="width:400px" type="text" name="searchText" class="form-control col-md-3" value="${pagingDTO.searchText }"/> 
							<input type="hidden" name="cateId" value="${cateDTO.cateId }"/>
							 <span class="input-group-btn">
								<button type="submit" class= "btn btn-default"><img src="/resources/images/search.png" style="width: 21px;"></button>
							</span>
						</div>
					</td>
				</tr>
			</table>
			</form>
				
				<br><br>
			
				<table class="table table-bordered">
					<tr style="background: #FFA800;">
						<th style="width:10%; text-align:center;">No</th>
						<th style="width:45%; text-align:center;">제목</th>
						<th style="width:15%; text-align:center;">글쓴이</th>
						<th style="width:20%; text-align:center;">등록일</th>
						<th style="width:10%; text-align:center;">조회수</th>
					</tr>
					<c:if test="${empty boardList}">
						<tr>
							<td colspan="5" style="text-align: center">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${boardList}" var="boardDTO" varStatus="status">
						<tr style="text-align: center">
							<td>${status.count }</td>
							<td><a href="/notice/detailContent?bno=${boardDTO.bNo}&pageNo=${param.pageNo }">${boardDTO.bTitle }</a></td>
							<td>${boardDTO.userId }</td>
							<td>${boardDTO.bRegDate }</td>
							<td><span class="badge" style="background-color: #BFC2C3;">${boardDTO.viewCnt}</span></td>
						</tr>
					</c:forEach>
				</table>
			
				<table align="right">
					<tr ><td>
						<!-- <a href="/category/writeForm" >글작성</a> -->
						<button type="button" class="btn btn-default" onclick="location.href='/notice/writeBoardForm?cateId=${cateDTO.cateId}'">
						<img src="/resources/images/writeBtn.png" style="width: 60px;"></button>
					</td></tr>
				</table><br/><br/>
				
				<div align = "center">
					 <ul class="pagination pagination-sm">
						<c:if test="${pagingDTO.groupNo > 1}">
							<li><a href="/notice/boardList?cateId=${cateDTO.cateId }&groupNo=1&searchType=${param.searchType}&searchText=${param.searchText}">처음</a></li>
							<li><a href="/notice/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.pageStartNo - 1}&searchType=${param.searchType}&searchText=${param.searchText}">◀</a></li>
						</c:if> <c:forEach var="i" begin="${pagingDTO.pageStartNo}" end="${pagingDTO.pageEndNo}">
							<c:choose>
								<c:when test="${pagingDTO.pageNo != i}">
									<li><a href="/notice/boardList?cateId=${cateDTO.cateId }&pageNo=${i}&searchType=${param.searchType}&searchText=${param.searchText}">${i}</a></li>
								</c:when>
								<c:otherwise> <li><a href="#" style="background-color: #085B86; color: white; font-weight: bold;">&nbsp;${i}&nbsp;</a></li> </c:otherwise>
							</c:choose>
						</c:forEach> 
						<c:if test="${pagingDTO.groupNo < pagingDTO.totalGroupCount}">
							<li><a href="/notice/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.pageEndNo + 1}">▶</a></li>
							<li><a href="/notice/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.totalPageCount}&searchType=${param.searchType}&searchText=${param.searchText}">마지막</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		</section>
		
		<!-- END SECTION -->
	   <!-- 각 페이지별 메뉴 색깔 제어 -->
	<script>
		$(document).ready(function(){
			$("#talktous").attr("class","active");
		})
	</script>
	
</div>
</body>
</html>