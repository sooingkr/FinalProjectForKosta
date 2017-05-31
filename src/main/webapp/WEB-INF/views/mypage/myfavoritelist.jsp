<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${loginSession.userId }의마이페이지</title>
</head>
<body>
	<!-- START TALK TO US SECTION -->
	<div class="f-page gray-bkg active" id="screen-about"
		style="background-color: #f8f8f8;">
		<!-- START HEADER -->
		<header class="site-header grey"> <span class="nav-trigger">
			<span class="nav-trigger-inside"> <span
				class="nav-trigger-line"></span></span>
		</span> <!-- START NAVIGATION MENU --> <%@include
			file="/WEB-INF/views/layout/navigationImport.jsp"%>
		<!-- END NAVIGATION MENU --> <!-- START SOCIAL ICON --> <%@include
			file="/WEB-INF/views/layout/socialIconImport.jsp"%>
		<!-- END SOCIAL ICON --> </header>
		<!-- END HEADER -->
		
		
		<section class="site-content full-height">
		<div class="content-frame">
			<div id="form-contact">
				<table class="table table-bordered">
					<tr style="background-color: #FFA800;">
						<th style="width: 5%; text-align: center;">No</th>
						<th style="width: 10%; text-align: center;">글번호</th>
						<th style="width: 10%; text-align: center;">카테고리</th>
						<th style="width: 35%; text-align: center;">제목</th>
						<th style="width: 10%; text-align: center;">작성자</th>
						<th style="width: 20%; text-align: center;">작성날짜</th>
						<th style="width: 10%; text-align: center;">좋아요</th>
					</tr>
					<c:if test="${empty MyFavoriteList}">
						<tr>
							<td colspan="5" style="text-align: center">좋아요한 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach items="${MyFavoriteList}" var="boardDTO"
						varStatus="status">
						<tr id="table123" style="text-align: center">
							<td>${status.count}</td>
							<td id="tablebNo">${boardDTO.bNo}</td>
							<td>${boardDTO.cateId}</td>
							<td><a
								href="/board/category/detailContent?bno=${boardDTO.bNo}">${boardDTO.bTitle }</a></td>
							<td>${boardDTO.userId }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${boardDTO.bRegDate }" /></td>
							<td><button id="likeButton" type="button"
									value="${status.count}" style="width: 70px;">
									<img id="likeImage" src="/resources/images/like2.png"
										style="width: 10px; height: 10px;" /> <span id="likeCount"></span>
								</button></td>
						</tr>
					</c:forEach>
				</table>

				<form action="/mypage/myFavoriteList">
					<table align="center">
						<tr>
							<td><select name="searchType" class="form-control col-md-3">
									<option value="titleContent"
										<c:if test="${pagingDTO.searchType eq 'titleContent'}" > selected="selected" </c:if>>제목+내용</option>
									<option value="writer"
										<c:if test="${pagingDTO.searchType eq 'writer'}" > selected="selected" </c:if>>글쓴이</option>
									<option value="title"
										<c:if test="${pagingDTO.searchType eq 'title'}" > selected="selected" </c:if>>제목</option>
							</select></td>
							<td>&nbsp;&nbsp;</td>
							<td>
								<div class="input-group">
									<input style="width: 400px" type="text" name="searchText"
										class="form-control col-md-3" value="${pagingDTO.searchText }" />
									<input type="hidden" name="cateId" value="${cateDTO.cateId }" />
									<span class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<img src="/resources/images/search.png" style="width: 21px;">
										</button>
									</span>
								</div>
							</td>
						</tr>
					</table>
				</form>



			<div align="center">
				<ul class="pagination pagination-sm">
					
					<c:forEach var="i" begin="${pagingDTO.pageStartNo}"
						end="${pagingDTO.pageEndNo}">
						<c:choose>
							<c:when test="${pagingDTO.pageNo != i}">
								<li><a
									href="/mypage/myList?pageNo=${i}&searchType=${param.searchType}&searchText=${param.searchText}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#"
									style="background-color: #085B86; color: white; font-weight: bold;">&nbsp;${i}&nbsp;</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagingDTO.groupNo < pagingDTO.totalGroupCount}">
						<li><a href="/mypage/myList?&pageNo=${pagingDTO.pageEndNo + 1}">▶</a></li>
						<li><a href="/mypage/myList?pageNo=${pagingDTO.totalPageCount}&searchType=${param.searchType}&searchText=${param.searchText}">마지막</a></li>
					</c:if>
				</ul>
			</div> 

			</div>
		</div>
		</section>

		<script>

	var tablebno =null; //클릭한 버튼 bno를 저장할 변수
	var favoriteBtn = null; //버튼객체 하위 이미지 태크를 넣을 변수
	$(document).on("click","#likeButton",function(event){
		var favoriteBtn = $(this).find("#likeImage");
		tablebno = $(this).parent().parent().find("#tablebNo").text();
		//alert($(this).val()); //현재 위치 값
		//alert("확인 : " + $(this).parent().parent().find("#tablebNo").text());
		update(tablebno,favoriteBtn);
	});

		/** 좋아요 체크 */
		function check(tablebno,favoriteBtn) {
			var bno = tablebno;
			var userId = "${loginSession.userId}";
			var btn = favoriteBtn;
			$.ajax({
				type : 'get',
				url : '/mypage/checkFavorite?bno=' + bno + '&userId=' + userId,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET"
				},
				dataType : 'text',
				success : function(result) {
	
					if (result == "SUCCESS") {
						btn.attr("src", "/resources/images/like2.png");
						//count(tablebno);
					}
					if (result == "FAIL") {
						btn.attr("src", "/resources/images/like1.png");
						//count(tablebno);
					}
				}
			});
		} // end of check()
	
		/** 좋아요 업데이트 */
		function update(tablebno,favoriteBtn) {
			var bno = tablebno;
			var userId = "${loginSession.userId}";
			var btn = favoriteBtn;
			$.ajax({
				type : 'get',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET"
				},
				url : '/mypage/handlingFavorite?bno=' + bno + '&userId=' + userId,
				dataType : 'text',
				success : function(data) {
					check(tablebno,favoriteBtn);
	
					if (data == "안뇽") {
						console.log("찍히나용?");
					}
				}
			}); // end of ajax from likeBoard Btn Click
		} // end of update()
	

	</script>
	</div>
</body>
</html>