<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${loginSession.userId }의마이페이지</title>
	<%@include file="/WEB-INF/views/note/includeModalCSS.jsp"%>
	<style>
		.star_rating {font-size:0; letter-spacing:-4px;}
		.star_rating a {
		    font-size:22px;
		    letter-spacing:0;
		    display:inline-block;
		    margin-left:5px;
		    color:#ccc;
		    text-decoration:none;
		}
		.star_rating a:first-child {margin-left:0;}
		.star_rating a.on {color:#F78E41;}
	</style>

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
		        <button id="closeBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- End of 구매결정 모달창 -->
		
		<!-- 후기작성 모달창 -->
		<a href="#x" class="overlay" id="review_form"></a>
		<div class="popup">
			<center> <h3 align="center">구매 후기 작성</h3> </center>
			<br>
			<form id="formName" action="/mypage/writeReview" method="post">
				<table class="table-bordered">
					<tr>
						<th style="text-align: center; width: 15%; height:34px; background-color: #F6F6F6">판매자</th>
						<td><span id="userId" style="margin-left:5px;"></span></td>
					</tr>
					<tr>
						<th style="text-align: center; width: 15%; height:34px; background-color: #F6F6F6">거래인</th>
						<td><span id="buyerId" style="margin-left:5px;" ></span></td>
					</tr>
					<tr>
						<th style="text-align: center; background-color: #F6F6F6">내용</th>
						<td><textarea rows="10" cols="80" name="pcontent" id="pcontent" class="form-control"></textarea></td>
					</tr>
					<tr>
						<th style="text-align: center; height:34px; background-color: #F6F6F6">별점</th>
						<td><p class="star_rating">
    						<a href="#" class="on">★</a>
    						<a href="#">★</a>
    						<a href="#">★</a>
    						<a href="#">★</a>
    						<a href="#">★</a></p>
							<input type="hidden" class="form-control" name="pscore" id="pscore"/></td>
					</tr>
				</table> 

				<br>
				<input type="hidden" name="bno" id="bno" />
				<div align="right">
					<button id="cancelBtn" type="button" class="btn btn-default">취소</button>
					<button id="reviewBtn" type="button" class="btn btn-warning">작성하기</button>
				</div>
			</form>
			<a class="close" href="#close"></a>
		</div>
		
		
		<div class="content-frame">
			<div id="side_nav" style="float: left; height: 100%; line-height: 6;">
				<ul style="list-style: none;">
					<li><a href="javascript:favirtelist();">좋아요 목록</a></li>
					<li><a href="javascript:myWriteList();">내가 올린 글</a></li>
					<li><a href="#">쪽지 보관함</a></li>
					<li><a data-toggle="modal" data-target="#myModal">회원정보 수정</a></li>
					<li><a href="javascript:myExchangeList();">거래중인 게시물</a></li>
				</ul>
			</div>
			
			<!-- 회원수정 페이지로 이동하기 위한 패스워드 입력 모달창 -->
					<!-- Modal -->
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">×</button>
			          <h4 class="modal-title">패스워드 확인창</h4>
			        </div>
			        <div class="modal-body">
			          <form id="form1" action="/user/modifyInfo" method="post">
				          <p>회원정보를 수정하기 위해 패스워드를 확인해주세요.</p>
				          <label>비밀번호</label><input id="pwId" type="password" name="password" class="form-control"/><br/>
			          </form>
			        </div>
			        <div class="modal-footer">
			          <button id="btnClick" type="button">확인</button>
			          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        </div>
			      </div>
			    </div>
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
							<th style="width: 10%; text-align: center;">좋아요</th>
						</tr>
						<c:if test="${empty MyFavoriteList}">
							<tr>
								<td colspan="7" style="text-align: center">좋아요한 게시글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${MyFavoriteList}" var="boardDTO"
							varStatus="status">
							<tr id="table123" style="text-align: center">
								<td>${status.count}</td>
								<td id="tablebNo">${boardDTO.bNo}</td>
								<td>${boardDTO.cateName}</td>
								<td><a href="/board/category/detailContent?bno=${boardDTO.bNo}">${boardDTO.bTitle }</a></td>
								<td>${boardDTO.userId }</td>
								<td>${boardDTO.bRegDate }</td>
								<td>
									<%-- 	<button id="likeButton" type="button"
									value="${status.count}" style="width: 70px;"></button> --%> <img
									id="likeImage" src="/resources/images/like2.png"
									style="width: 20px; height: 20px;" /> <span id="likeCount"></span>
								</td>
							</tr>
						</c:forEach>
					</table>

				<%-- 	<form action="/mypage/myFavoriteList">
						<table align="center">
							<tr>
								<td><select name="searchType" class="form-control col-md-3">
										<option value="titleContent"
											<c:if test="${pageMaker.searchType eq 'titleContent'}" > selected="selected" </c:if>>제목+내용</option>
										<option value="writer"
											<c:if test="${pageMaker.searchType eq 'writer'}" > selected="selected" </c:if>>글쓴이</option>
										<option value="title"
											<c:if test="${pageMaker.searchType eq 'title'}" > selected="selected" </c:if>>제목</option>
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
					</form> --%>
					<!-- 
                       	[이전][1][2][3]...[10][다음] 부분 작성
                        -->
							<!-- [이전] -->
							<div class="text-center">
								<ul class="pagination">
									<li><a
										href="/mypage/myList${pageMaker.pageQuery(1)}">처음</a>
									</li>
									<c:if test="${pageMaker.prev}">
										<li><a
											href="/mypage/myList${pageMaker.pageQuery(pageMaker.startPage-1)}">◀</a>
										</li>
									</c:if>
									<!-- [1][2][3]...[10] -->
									<c:forEach var="index" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li ${pageMaker.page == index ? 'class=active' : '' }><a
											href="/mypage/myList${pageMaker.pageQuery(index)}">${index}</a>
										</li>
									</c:forEach>
									<!-- [다음] -->
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="/mypage/myList${pageMaker.pageQuery(pageMaker.endPage+1)}">▶</a>
										</li>
									</c:if>
									<!-- [마지막] -->
									<li><a
										href="/mypage/myList${pageMaker.pageQuery(pageMaker.entireEndPage)}">마지막</a>
									</li>
								</ul>
							</div>
							<!-- 쪽지 페이징 처리 -->
					
				</div>
			</div>


		</div>
		</section>
		
		
		<!-- 회원정보수정 -->
		<c:if test="${map.msg eq 'FAIL'}">
			<script>
		 	  	alert("실패했습니다");
	 	  	</script>
		</c:if>
		

		<script>
			/* 회원정보수정 */
			$(document).ready(function(){
				$("#btnClick").on("click",function(event){
					var formId = $("#form1");
					formId.submit();
				});// end of btnClick
		  	});// end of ready()

		
			// 거래인 지정용 전역변수
			var spanCustomer;
			// 거래인 지정하면 해당 버튼 비활성화하기 위한 객체 저장 전역변수
			var buyerBtn;	
		
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
							str += "<th style='text-align:center;'>구매결정</th>";
							str += "<th>거래인</th>";
							str += "</tr>";
							$.each(result.MyBoardList, function(i, board) {
								
								str += "<tr>";
								str += "<td style='text-align: center;'>" + board.bNo + "</td>";
								str += "<td>" + board.cateId + "</td>";
								str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"'>"+ board.bTitle +" </a> </td>";
								str += "<td style='text-align: center;'>" + board.userId + "</td>";
								str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
								
								// bno값가지고 eval 테이블에서 해당 거래자 id가져오기
								$.ajax({
									type:'GET',
									async:false,
									url:'/mypage/getCustomer?bno='+board.bNo,
									headers:{
										"Content-Type":"application/json"
									},
									success:function(result){
										if ( result ){
											str += "<td style='text-align: center;'><button  disabled=true class='btn btn-default testBtn' data-target='#layerpop' data-toggle='modal'>거래인 지정</button></td>";
										}else{
											str += "<td style='text-align: center;'><button class='btn btn-default testBtn' data-target='#layerpop' data-toggle='modal'>거래인 지정</button></td>";
										}
										str += "<td style='text-align: center;'><span class='customerId'>"+ result +"</span></td>";
									}
								}); // end of ajax
								str += "</tr>";
							});
							str += "</div>";
							str += "</table>";
							$("#formWrapper").append(str);
						}
					}
				});
			} // end of myWriteList()
			
			
			
			
			$(document).on("click",".testBtn",function(event){
				var bno = $(this).parent().prev().prev().prev().prev().prev().text();
				var userId = $(this).parent().prev().prev().text();
				var cateId = $(this).parent().prev().prev().prev().prev().text();
				// 클릭했던 곳의 span 태그 객체를 저장
				spanCustomer = $(this).parent().next().find(".customerId");
				// 해당 버튼 객체 저장
				buyerBtn = $(this);
				$("#bnoId").val(bno);
				$("#userIdVal").val(userId);
				$("#cateIdVal").val(cateId);
				
			});
			$(document).on("click","#closeBtn",function(event){
				$(".determine").val("");
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
								$(".determine").focus();
							}else if ( data == 'SUCCESS' ){
								alert("게시글의 상태가 거래중으로 바꼈습니다.");
								//해당 버튼 비활성화하기
								buyerBtn.prop("disabled", true);
								$("#layerpop").hide();
								$(".determine").val("");
								spanCustomer.html(txt);
							}else if ( data == "DUPLICATE"){
								alert("이미 거래중인 고객입니다.");
								$(".determine").focus();
							}
						}
					});
				}
			});
			
			
			function myExchangeList(){
				var form = $("#form-contact");
				$.ajax({
					type : 'get',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					url : '/mypage/myExchangeList',
					dataType : 'json',
					success : function(data) {
						console.log(data);
						if (data.result == "ok") {
							var str = "";
							
							$("#form-contact").remove();
							str += "<div id='form-contact' style='padding-left: 1%'>";
							str += "<table class='table table-bordered'>";
							str += "<tr style='background-color: #FFA800;'>";
							str += "<th style='width: 5%; text-align: center;'>No</th>";
							str += "<th style='width: 10%; text-align: center;'>카테고리</th>";
							str += "<th style='width: 45%; text-align: center;'>제목</th>";
							str += "<th style='width: 10%; text-align: center;'>작성자</th>";
							str += "<th style='width: 20%; text-align: center;''>작성날짜</th>";
							str += "<th style='text-align:center;'>구매후기</th>";
							str += "</tr>";
							
							if( data.pagingDTO.totalRecordCount == 0){
								str +="<tr><td colspan='6' style='text-align:center;'> 거래중인 게시글이 없습니다. </td></tr> ";	
								$("#formWrapper").append(str);
								return;
							}
							
							$.each(data.MyExchangeList, function(i, board) {
								
								str += "<tr>";
								str += "<td style='text-align: center;'>" + board.bNo + "</td>";
								str += "<td>" + board.cateId + "</td>";
								str += "<td> <a href='/board/category/detailContent?bno="+board.bNo+"'>"+ board.bTitle +" </a> </td>";
								str += "<td style='text-align: center;'>" + board.userId + "</td>";
								str += "<td style='text-align: center;'>" + board.bRegDate + "</td>";
								/* str += "<td style='text-align: center;'><button class='reviewBtn' data-target='#login_form' data-toggle='overlay'>후기 작성</button></td>"; */
								str += "<td style='text-align: center;'>"
									+  "<a href='#review_form' id='a_review' class='btn btn-link' style='text-decoration:none;background-color:#eee;border-radius:10px;'><span>후기 작성</span></a></td>";
								str += "</tr>";
							});
							str += "</div>";
							str += "</table>";
							
							// 페이징 처리
							str += "<div align = 'center'>" +
										"<ul class='pagination pagination-sm'>";
										if(data.pagingDTO.groupNo > 1){
											str += "<li>" 
												+	"<a href='/mypage/myExchangeList?"+data.pagingDTO.groupNo+"=1'>처음</a>" 
												+ "</li>" 
												+ "<li>"
												+ 	"<a href='/mypage/myExchangeList?pageNo="+data.pagingDTO.pageStartNo - 1+">◀</a>" 
												+ "</li>";
										}
										for(var i=data.pagingDTO.pageStartNo; i <= data.pagingDTO.pageEndNo; i++){
											if(data.pagingDTO.pageNo != i){
												str += "<li><a href='/mypage/myExchangeList?pageNo="+i+"'>" +i +"</a></li>";
											}else{
												str += "<li><a href='#' style='background-color: #085B86; color: white; font-weight: bold;'>&nbsp;"+ i +"&nbsp;</a></li>";
											}
											
										}
										if(data.pagingDTO.groupNo < data.pagingDTO.totalGroupCount){
											str += "<li><a href='/mypage/myExchangeList?pageNo="+data.pagingDTO.pageEndNo + 1 +"'>▶</a></li>"
												+ "<li><a href='/mypage/myExchangeList?pageNo="+data.pagingDTO.totalPageCount+"'>마지막</a></li>";
										}		
									str +="</ul>"
									+"</div>";
							
							$("#formWrapper").append(str);
						}
					}
				});
			} // end of myExchangeList()
			
			// 후기 작성 버튼 눌렀을 때 데이터 저장 처리
			$(document).on("click","#a_review",function(event){
				var bno = $(this).parent().prev().prev().prev().prev().prev().text();
				var userId = $(this).parent().prev().prev().text();
				var buyerId = "${loginSession.userId }";
				$("#bno").val(bno);
				$("#userId").text( userId);
				$("#buyerId").text( buyerId);
				
			});
			
			// 별점 클릭했을 때 동작하는 함수
			$( ".star_rating a" ).click(function() {
			     $(this).parent().children("a").removeClass("on");
			     $(this).addClass("on").prevAll("a").addClass("on");
			     return false;
			});
			
			
			var formName = $("#formName");
			// 후기 작성 모달창에서 작성을 누르면 호출되는 이벤트 함수 
			$("#reviewBtn").on("click",function(event){
				var bno = $("#bno").val();
				var score = $(".star_rating").find(".on").length;
				//alert(bno+"번 : "+score+"점");
				
				
				$("#pcontent").val("");
				$(".star_rating").children("a").removeClass("on");
				formName.submit();
			});
			
			$("#cancelBtn").on("click", function(evnet) {
				$("#pcontent").val("");		// 내용 비우기
				$(".star_rating").children("a").removeClass("on");	// 별점 지우기
				history.back(); // 뒤로가기
			}); // end of cancelBtn
			
		</script>

	</div>
</body>
</html>