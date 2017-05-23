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
	<%-- <c:if test="${result == 'ok'}">
		<script type="text/javascript">
			console.log("ok");
			alert("게시글 작성이 완료되었습니다.");
		</script>
	</c:if>
	<c:if test="${result == 'fail'}">
		<script type="text/javascript">
			alert("게시글 작성에 실패하였습니다.");
		</script>
	</c:if> --%>
	<!-- START NOTICE BOARD SECTION -->
	<div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;" >
		<!-- START HEADER -->
		<header class="site-header yellow"> <span class="nav-trigger">
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
				<h1 id="hello">${cateDTO.cateName}</h1>
				<!-- <button class="button" value="Show map">SHOW MAP</button>
				<div id="googlemap">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7407.084900169444!2d73.71531610873852!3d21.836602579155294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39601e76cfab0f2f%3A0xde6b6769555c29d9!2sStatue+of+Unity!5e0!3m2!1sen!2sin!4v1457959783722"
						width="100%" height="300" frameborder="0" style="border: 0" allowfullscreen></iframe>
				</div> -->

				<table class="table table-bordered">
					<tr>
						<td colspan="5" align="center">
							<form action="/notice/boardList" >
								검색 : 
								<select name="searchType">
									<option value="titleContent">제목+내용</option>
									<option value="writer">글쓴이</option>
									<option value="title">제목</option>
								</select> 
								<input style="width:400px" type="text" name="searchText" /> 
								<input type="hidden" name="cateId" value="${cateDTO.cateId }"/>
								<input type="submit" value="검색" />
							</form>
						</td>
					</tr>
					<tr style="background:#aaa;">
						<th style="width:10%; text-align:center;">No</th>
						<th style="width:45%; text-align:center;">제목</th>
						<th style="width:15%; text-align:center;">글쓴이</th>
						<th style="width:20%; text-align:center;">등록일</th>
						<th style="width:10%; text-align:center;">조회수</th>
					</tr>
					<c:forEach items="${boardList}" var="boardDTO" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><a href="/notice/detailContent?bno=${boardDTO.bNo}">${boardDTO.bTitle }</a></td>
							<td>${boardDTO.userId }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardDTO.bRegDate }"/></td>
							<td><span class="badge bg-red">${boardDTO.viewCnt}</span></td>
						</tr>
					</c:forEach>

					<tr align="center">
						<td colspan="5">
							<c:if
								test="${pagingDTO.groupNo > 1}">&lt;&lt;
								<a href="/notice/boardList?cateId=${cateDTO.cateId }&groupNo=1&searchType=${param.searchType}&searchText=${param.searchText}">처음</a>&nbsp;&nbsp; 
								<a href="/notice/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.pageStartNo - 1}&searchType=${param.searchType}&searchText=${param.searchText}">&lt;이전
								</a>
							</c:if> <c:forEach var="i" begin="${pagingDTO.pageStartNo}" end="${pagingDTO.pageEndNo}">
								<c:choose>
									<c:when test="${pagingDTO.pageNo != i}">
										<a href="/category/boardList?cateId=${cateDTO.cateId }&pageNo=${i}&searchType=${param.searchType}&searchText=${param.searchText}">[${i}]</a>
									</c:when>
									<c:otherwise> [${i}] </c:otherwise>
								</c:choose>
							</c:forEach> 
							<c:if test="${pagingDTO.groupNo < pagingDTO.totalGroupCount}">
								<a href="/notice/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.pageEndNo + 1}"> 다음&gt;</a> &nbsp;&nbsp;
								<a href="/notice/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.totalPageCount}&searchType=${param.searchType}&searchText=${param.searchText}">마지막</a>&gt;&gt;
							</c:if>
						</td>
					</tr>

				</table>
				<table align="right">
					<tr ><td>
						<!-- <a href="/category/writeForm" >글작성</a> -->
						<button type="button" onclick="location.href='/notice/writeBoardForm?cateId=${cateDTO.cateId}'">글작성</button>
					</td></tr>
				</table>
		
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