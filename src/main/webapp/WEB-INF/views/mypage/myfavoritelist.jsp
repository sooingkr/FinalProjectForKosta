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
		<div class="main_header">
			<header class="site-header grey"> <span class="nav-trigger">
				<span class="nav-trigger-inside"> <span
					class="nav-trigger-line"></span></span>
			</span> <!-- START NAVIGATION MENU --> <%@include
				file="/WEB-INF/views/layout/navigationImport.jsp"%>
			<!-- END NAVIGATION MENU --> <!-- START SOCIAL ICON --> <%@include
				file="/WEB-INF/views/layout/socialIconImport.jsp"%>
			<!-- END SOCIAL ICON --> </header>
			<!-- END HEADER -->
		</div>



		<section class="site-content full-height">
		
		<!-- 구매결정 모달창 -->
		<div class="modal fade" id="layerpop" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- header -->
		      <div class="modal-header">
		        <!-- 닫기(x) 버튼 -->
		        <button type="button" class="close" data-dismiss="modal">×</button>
		        <!-- header title -->
		        <h4 class="modal-title">구매결정 폼</h4>
		      </div>
		      <!-- body -->
		      <div class="modal-body">
		      	<input type="hidden" id="bnoId" /><br/>
		      	<input type="hidden" id="userIdVal" /><br/>
		      	<input type="hidden" id="cateIdVal" />
		      	<label>거래할 사용자 ID</label>
				<input type="text" class="determine"/><button type='button' class='determineBtn'>결정</button> 
		      </div>
		      <!-- Footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- End of 구매결정 모달창 -->
		
		<div class="content-frame">
			<div id="side_nav" style="float: left; height: 100%; line-height: 6;">
				<ul style="list-style: none;">
					<li><a href="javascript:favirtelist();">좋아요 목록</a></li>
					<li><a href="javascript:myWriteList();">내가 올린 글</a></li>
					<li><a href="#">쪽지 보관함</a></li>
					<li><a href="#">회원정보 수정</a></li>
				</ul>
			</div>

			<div id="formWrapper">

				<div id="form-contact" style="padding-left: 1%">
					<table class="table table-bordered">
						<tr style="background-color: #FFA800;">
							<th style="width: 5%; text-align: center;">No</th>
							<th style="width: 10%; text-align: center;">글번호</th>
							<th style="width: 10%; text-align: center;">카테고리</th>
							<th style="width: 35%; text-align: center;">제목</th>
							<th style="width: 10%; text-align: center;">작성자</th>
							<th style="width: 20%; text-align: center;">작성날짜</th>
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
								<td><a href="/board/category/detailContent?bno=${boardDTO.bNo}">${boardDTO.bTitle }</a></td>
								<td>${boardDTO.userId }</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardDTO.bRegDate }" /></td>
								<td>
									<%-- 	<button id="likeButton" type="button"
									value="${status.count}" style="width: 70px;"></button> --%> <img
									id="likeImage" src="/resources/images/like2.png"
									style="width: 20px; height: 20px;" /> <span id="likeCount"></span>
								</td>
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
											class="form-control col-md-3"
											value="${pagingDTO.searchText }" /> <input type="hidden"
											name="cateId" value="${cateDTO.cateId }" /> <span
											class="input-group-btn">
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
										<li><a href="/mypage/myList?pageNo=${i}&searchType=${param.searchType}&searchText=${param.searchText}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#"
											style="background-color: #085B86; color: white; font-weight: bold;">&nbsp;${i}&nbsp;</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pagingDTO.groupNo < pagingDTO.totalGroupCount}">
								<li><a
									href="/mypage/myList?&pageNo=${pagingDTO.pageEndNo + 1}">▶</a></li>
								<li><a
									href="/mypage/myList?pageNo=${pagingDTO.totalPageCount}&searchType=${param.searchType}&searchText=${param.searchText}">마지막</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

		</div>
		</section>

		<script>
		
			var tablebno = null; //클릭한 버튼 bno를 저장할 변수
			var favoriteBtn = null; //버튼객체 하위 이미지 태크를 넣을 변수
			$(document).on("click", "#likeImage", function(event) {
				//				var favoriteBtn = $(this).find("#likeImage");
				var favoriteBtn = $(this);
				tablebno = $(this).parent().parent().find("#tablebNo").text();
				//alert($(this).val()); //현재 위치 값
				//alert("확인 : " + $(this).parent().parent().find("#tablebNo").text());
				update(tablebno, favoriteBtn);
			});
		
			/** 좋아요 체크 */
			function check(tablebno, favoriteBtn) {
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
			function update(tablebno, favoriteBtn) {
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
						check(tablebno, favoriteBtn);
		
						if (data == "안뇽") {
							console.log("찍히나용?");
						}
					}
				}); // end of ajax from likeBoard Btn Click
			} // end of update()
		
		
			/** 내가 쓴 글  업데이트 */
			function myWriteList() {
				var form = $("#form-contact");
				alert("myWriteList()호출");
				$.ajax({
					type : 'get',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					url : '/mypage/myBoardList',
					dataType : 'json',
					success : function(result) {
						if (result.success == "success") {
							var str = "";
							$("#form-contact").remove();
							str += "<div id='form-contact' style='padding-left: 1%'>";
							str += "<table class='table table-bordered'>";
							str += "<tr style='background-color: #FFA800;'>";
							str += "<th style='width: 5%; text-align: center;'>No</th>";
							str += "<th style='width: 10%; text-align: center;'>카테고리</th>";
							str += "<th style='width: 35%; text-align: center;'>제목</th>";
							str += "<th style='width: 10%; text-align: center;'>작성자</th>";
							str += "<th style='width: 20%; text-align: center;''>작성날짜</th>";
							str += "<th>구매결정</th>";
							str += "</tr>";
							$.each(result.MyBoardList, function(i, board) {
								str += "<tr>";
								str += "<td>" + board.bNo + "</td>";
								str += "<td>" + board.cateId + "</td>";
								str += "<td> <a href='/board/category/detailContent?bno='"+board.bNo+"'>'"+ board.bTitle +" </a> </td>";
								str += "<td>" + board.userId + "</td>";
								str += "<td>" + board.bRegDate + "</td>";
								str += "<td><button class='btn btn-default testBtn' data-target='#layerpop' data-toggle='modal'>판매자 지정</button></td>";
								str += "</tr>";
							});
							str += "</div>";
							str += "</table>";
							$("#formWrapper").append(str);
							if(result.pagingDTO.pageNo !=null){
							
							}
						}
					}
				});
			} // end of update()
			
			
			$(document).on("click",".testBtn",function(event){
				var bno = $(this).parent().prev().prev().prev().prev().prev().text();
				var userId = $(this).parent().prev().prev().text();
				var cateId = $(this).parent().prev().prev().prev().prev().text();
				$("#bnoId").val(bno);
				$("#userIdVal").val(userId);
				$("#cateIdVal").val(cateId);
				
			});
			
			// 구매 결정 모달창에서 거래할 사람 아이디가 존재하는지 확인하고 있으면 검색처리 진행
			$(".determineBtn").on("click",function(event){
				var txt = $(".determine").val();
				if ( txt == null || txt == '' ){
					alert("사용자를 지정하세요.");
					txt.focus();
					return;
				}else{
					$.ajax({
						type:'post',
						url:'/mypage/existIdCheck',
						headers:{
							"Content-Type":"application/json"
						},
						dataType:'text',
						data:JSON.stringify({
							userId:$("#userIdVal").val(),
							bno:$("#bnoId").val(),
							cateId:$("#cateIdVal").val(),
							buyerId:txt
						}),
						success:function(data){
							if ( data == 'FAIL' ){
								alert("존재하지 않는 사용자 입니다. 다시 확인해주세요.");
								txt.focus();
							}else if ( data == 'SUCCESS' ){
								alert("게시글의 상태가 거래중으로 바꼈습니다.");
							}
						}
					});
				}
			});
		</script>

	</div>
</body>
</html>