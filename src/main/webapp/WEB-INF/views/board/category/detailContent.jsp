<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-------------------------------------------- category section 게시글 상세보기 ---------------------------------------------->

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${cateDTO.cateName}</title>
	<script type="text/javascript" src="/resources/js/fileupload.js"></script>
<style>
#modDiv {
	width: 300px;
	height: 100px;
	background-color: gray;
	border-radius: 10px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -150px;
	padding: 10px;
	z-index: 1000;
}
/* 
	구글맵 style 적용
 */
#map {
        width: 100%;
        height: 400px;
        background-color: grey;
      }
</style>
</head>
<body class="index page-index">
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
			
				<!-- GoogleMap API 연동(황영롱) -->
				<h3>My Google Maps Demo</h3>
			    <div id="map"></div> <!-- 지도가 붙을 위치 -->
			    <script>
			      var address = null;
			      function getAddr(){
			    	  $.ajax({
				    		type:'post',
				    		headers:{
				    			"Content-Type":"application/json"
				    		},
				    		async : false, // ajax를 동기화(순서대로) 처리해야하는 경우 true로하거나 기술하지 않으면 비동기로 작동한다.
				    		url:"/board/category/getAddr?userId=${boardDTO.userId}",
				    		dataType:"text",
				    		success : function(result){
				    			if ( result != null ){
				    				console.log("넘어온 값 : " + result);
					    			address = result;	
				    			}
				    		}
				    	});
			      };
			      function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수
			      	getAddr();
			    	var latVal = ${boardDTO.lat}; // 게시글 DTO에서 위도값을 가져옴
			    	var lngVal = ${boardDTO.lon}; // 게시글 DTO에서 경도값을 가져옴
			        var mapLocation = {lat: latVal, lng: lngVal}; // 위도, 경도를 가지는 객체를 생성
			    /*     var map = new google.maps.Map(document.getElementById('map'), { // 위의 div id="map" 부분에 지도를 추가하는 부분
			          zoom: 18, // 확대 정도(ZOOM)
			          center: uluru // 지도에 표시해주는 중심이 우리가 만든 객체의 위치를 지정해주도록 함
			        });
			         */
			        var mapOptions = {
			                center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
			                zoom: 18, // 지도 zoom단계
			                mapTypeId: google.maps.MapTypeId.ROADMAP
			              };
			              var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
			                  mapOptions);
			               
			              var size_x = 60; // 마커로 사용할 이미지의 가로 크기
			              var size_y = 60; // 마커로 사용할 이미지의 세로 크기
			               
			              // 마커로 사용할 이미지 주소
			              var image = new google.maps.MarkerImage( 'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
			                                  new google.maps.Size(size_x, size_y),
			                                  '',
			                                  '',
			                                  new google.maps.Size(size_x, size_y));
			               
			              var marker;
			              marker = new google.maps.Marker({
			                     position: mapLocation, // 마커가 위치할 위도와 경도(변수)
			                     map: map,
			                     icon: image, // 마커로 사용할 이미지(변수)
			                     title: "${boardDTO.userId}(님) 의 거래 희망 위치" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
			              });
			               
			              var content = "${boardDTO.userId} 님은 "+address+" 근처에서 거래를 희망합니다."; // 말풍선 안에 들어갈 내용
			               
			              // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
			              var infowindow = new google.maps.InfoWindow({ content: content});
			       
			              google.maps.event.addListener(marker, "click", function() {
			                  infowindow.open(map,marker);
			              });
			               
			       
			        /*
			         단순한 마커로 default로 표시할 때 쓰는 마커 세팅
			        var marker = new google.maps.Marker({
			            position: uluru,
			            map: map
			          });
			        
			         */
			      }
			    </script>
			    <!-- 
			    	아래는 서버로부터 지도를 로딩하기 위해 요청하는 경로 async는 비동기로 로딩하도록해 지도 로딩 중 다른 웹 부분들이 열릴 수 있도록하기 위함
			    	key부분에는 자신의 키를 넣고, 로딩이 완료되면 callback에 지정한 함수를 수행하게 됨.
			     -->
			    <script async defer
			    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1I06mbe3rTV903iEx-aOyO4MFTnaDEvw&callback=initMap">
			    </script>
				<!-- End of GoogleMap API 연동(황영롱) -->
				
			
				<h1 id="hello">${cateDTO.cateName}</h1>
				<table class="table table-bordered">
					<tr>
						<th style="width: 20%; background: #aaa; text-align: center;">카테고리</th>
						<td>${cateDTO.cateName}<input type="hidden" name="bCategory"
							value="${boardDTO.cateId}" /></td>
						<th style="width: 20%; background: #aaa; text-align: center;">조회수</th>
						<td>${boardDTO.viewCnt }</td>
					</tr>
					<tr>
						<th style="width: 20%; background: #aaa; text-align: center;">작성일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardDTO.bRegDate }" /></td>
						<th style="width: 20%; background: #aaa; text-align: center;">수정일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${boardDTO.bModifyDate }" /></td>
					</tr>
					<tr>
						<th style="width: 20%; background: #aaa; text-align: center;">작성자</th>
						<td colspan="3">${boardDTO.userId}</td>
					</tr>
					<tr>
						<th style="width: 20%; background: #aaa; text-align: center;">제목</th>
						<td colspan="3">${boardDTO.bTitle}</td>
					</tr>
					<tr>
						<th style="width: 20%; background: #aaa; text-align: center;">내용</th>
						<td colspan="3"><pre style="height: 300px;">${boardDTO.bContent}</pre>
							<c:forEach var="fileName" items="${fileList}">
							<p>
								<a id="hrefId" href="javascript:hrefFunc('${fileName}')" target="_blank" >
								<img src="/board/displayFile.do?fileName=${fileName}"></img></a></p>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th style="width: 20%; background: #aaa; text-align: center;">상품가치</th>
						<td colspan="3">${boardDTO.value}원</td>
					</tr>
				</table>
				<table align="right">
					<tr>
						<c:if test="${loginSession.userId != null }">
							<td>
								<div id="content">
									<button id="likeButton" type="button" style="width: 70px;">
										<img id="likeImage" src="" style="width: 10px; height: 10px;" />
										<span id="likeCount"></span>
									</button>
								</div>
						</c:if>

						<c:if test="${loginSession.userId == boardDTO.userId }">
							<td>&nbsp;
								<button type="button" style="width: 70px"
									onclick="location.href='/board/category/updateContentForm?bNo=${boardDTO.bNo}&pageNo=${param.pageNo }'">글수정</button>
							</td>
							<td>&nbsp;
								<button style="width: 70px" type="button"
									onclick="deleteContent()">글삭제</button>
							</td>
						</c:if>
						<td align="right">&nbsp;
							<button type="button" style="width: 70px"
								onclick="location.href='/board/category/boardList?cateId=${cateDTO.cateId}&pageNo=${param.pageNo }'">목록</button>
						</td>
					</tr>
				</table>
				<br />
				<br />

				<!--------------------------- 댓글 리스트 ---------------------------------->
				<h1>댓글 LIST</h1>
				<table class="table table-bordered">
					<tr style="background: #aaa;">
						<th style="width: 10%; text-align: center;">작성자</th>
						<th style="text-align: center;">내용</th>
						<th style="width: 20%; text-align: center;">작성일</th>
						<th style="width: 20%; text-align: center;">수정일</th>
						<th style="width: 7%; text-align: center;">수정</th>
					</tr>
					<tbody id="replyTable"></tbody>
				</table>

				<table align="center">
					<tr>
						<td>
							<button type="button" id="moreReplyList"
								onclick="showNextReplyList()">댓글 더보기</button>
							&nbsp;&nbsp;
							<button type="button" id="allReplyList"
								onclick="getAllList()">댓글 전체보기</button>
						</td>
					</tr>
				</table>
				<br />

				<h4>
					<b>댓글 작성하기</b>
				</h4>
				<table class="table table-bordered">
					<tr style="background: #aaa;">
						<th style="width: 15%; text-align: center;">
							${loginSession.userId } <input style="width: 100%; border: 0;"
							type="hidden" name="replyId" value="${loginSession.userId }"
							id="newReplyWriter" />
						</th>
						<td><input style="width: 100%; border: 0;" type="text"
							name="rContent" id="newReplyContent" /></td>
						<td><input type="checkbox" id="secretReply"/>비밀댓글</td>	
						<td style="width: 10%"><button style="width: 50px"
								id="replyAddBtn">작성</button></td>
					</tr>
				</table>
				<br />

				<!--------------- 댓글 수정 폼 ---------------------->
				<div id="modDiv" style="display: none;">
					<div class="modal-title"></div>
					<div>
						<input type="text" style="width: 100%" id="replytext" />
					</div>
					<div align="center">
						<button type="button" id="replyModBtn">수정</button>
						<button type="button" id="replyDelBtn">삭제</button>
						<button type="button" id="closeBtn">닫기</button>
					</div>
				</div>

			</div>
		</div>
		</section>
		<script type="text/javascript">
		
			//게시글 삭제 버튼 클릭시
			function deleteContent() {
				if (confirm("정말 삭제하시겠습니까?")) {
					location.href = "/board/category/deleteContentProc?bno=${boardDTO.bNo}&cateId=${cateDTO.cateId}";
				} else {
					return;
				}
			}
		
			var replyListTotCnt = 0; // 댓글 총 갯수
			var replyStartRow = 0; // ajax로 가져올 댓글의 시작 행 번호
		
			//ready 함수
			$(function() {
		
				//좋아요 체크
				check();
		
				//댓글 리스트 가져와서 뿌려주는 함수
				showNextReplyList();
		
				// 댓글 등록 클릭했을 때
	            $("#replyAddBtn").on("click", function() {
	               // 입력한 댓글 값들을 가져옴
	               var replyer = $("#newReplyWriter").val();
	               var replyText = $("#newReplyContent").val();
	               var bno = "${boardDTO.bNo}";
	               var secretReply="N";
	               
	               if($("#secretReply").is(":checked")){
	                  secretReply="Y";
	               }
	      
	               if (replyText.trim() == "") {
	                  alert("내용을 작성해주세요.");
	                  return;
	               }
	      
	               $.ajax({
	                  type : "post",
	                  url : "/replies/insertBoardReply",
	                  headers : {
	                     "Content-Type" : "application/json",
	                     "X-HTTP-Method-Override" : "POST"
	                  },
	                  dataType : "json",
	                  data : JSON.stringify({
	                     bNo : bno,
	                     replyId : replyer,
	                     rContent : replyText,
	                     isSecret : secretReply
	                  }),
	                  success : function(data) {
	                     console.log(data);
	                     console.log(data.result);
	                     if (data.result == "ok") {
	                        alert("등록되었습니다.");
	                        getAllList(); //전체 목록 뿌리기
	                     } else {
	                        alert("등록 실패");
	                     }
	                  }
	               }); // end of ajax
	               // 댓글 초기화
	               $("#newReplyWriter").val("");
	               $("#newReplyContent").val("");
	      
	            }); // end of 댓글등록 클릭
		
				// 댓글 옆 수정 버튼
				$("#replyTable").on("click", "#replyDetail", function() {
					//#("#부모id").on("click","그 안의 id",function(event){})
		
					// 자신(this:#replyDetail) 의 앞에 있는 태그(prev)의 속성 값 가져오기
					var rno = $(this).prev().prev().attr("value"); // rNo의 값
					var bno = "${boardDTO.bNo}";
					var replytext = $(this).prev().attr("value"); // rContent의 값
		
					// 댓글 수정 버튼을 클릭했을 때, 수정폼에 해당 정보가 미리 입력되어 있을 수 있도록 세팅.
					$(".modal-title").html(rno);
					$("#replytext").val(replytext);
					$("#modDiv").show("slow");
				}); // end of 댓글등록 클릭
		
				// 댓글 삭제 버튼 클릭시
				$("#replyDelBtn").on("click", function() {
					var rno = $(".modal-title").html();
					var replytext = $("#replytext").val();
		
					$.ajax({
						type : 'delete',
						url : '/replies/' + rno,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "DELETE"
						},
						dataType : "json",
						success : function(data) {
							if (data.result == "ok") {
								alert("삭제되었습니다.");
								// 삭제가 성공적으로되면 댓글 수정 폼을 다시 hide하고
								$("#modDiv").hide("slow");
								getAllList(); //전체 목록 뿌리기
							}
						}
					}); // end of ajax
		
				}); // end of del
		
				// 댓글 수정버튼 클릭시
				$("#replyModBtn").on("click", function() {
					var rno = $(".modal-title").html();
					var replytext = $("#replytext").val();
		
					if (replytext.trim() == "") {
						alert("내용을 작성해주세요.");
						return;
					}
		
					$.ajax({
						type : 'put',
						url : "/replies/" + rno,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PUT"
						},
						dataType : "json",
						data : JSON.stringify({
							rContent : replytext
						}),
						success : function(data) {
							if (data.result == "ok") {
								alert("수정되었습니다.");
								$("#modDiv").hide("slow");
								getAllList(); //전체 목록 뿌리기
							}
						}
					});
				}); // end of replyModeBtn
		
				// 댓글 수정 폼 닫기 클릭
				$("#closeBtn").on("click", function() {
					// 폼을 다시 안보이게 해줌
					$("#modDiv").hide("slow");
				})
		
				$("#likeButton").on("click", function(event) {
					update();
				});
		
		
			}); // end of ready
		
			/* 다음 댓글 리스트 표시하는 함수 */
			function showNextReplyList() {
				// 알고 있어야 되는 정보 : 전체 댓글 갯수, 현재 댓글의 startRow
				$.ajax({
					type : "post",
					/* headers:{
						"Content-Type":"application/json"
					}, */
					url : "/replies/boardReplyAjax",
					data : {
						bNo : "${param.bno}",
						startRow : replyStartRow
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						console.log(data.loginUserId);
						if (data.result == "ok") {
							// 댓글 리스트 출력
							$.each(data.replyList, function(i, rDTO) {
								
								var str = "";
								str += "<tr>";
								str += "<td width='10%'>" + rDTO.replyId + "</td>";
								str += "<td>" + rDTO.rContent + "</td>";
								str += "<td width='20%'>" + rDTO.rRegDate + "</td>";
								str += "<td width='20%'>" + rDTO.rModifyDate + "</td>";
								str += "<td><input type='hidden' id='rNo' value='" + rDTO.rNo + "'/>";
								str += "<input type='hidden' id='rContent' value='" + rDTO.rContent + "'/>";
								
								if(data.loginUserId == rDTO.replyId){
									str += "<button type='button' id='replyDetail'>수정</button>";
								}
								
								str += "</td></tr>"
		
								$("#replyTable").append(str);
							});
		
							//더보기 버튼에 대한 처리
							replyListTotCnt = data.replyTotCnt;
							replyStartRow += data.replyList.length * 1; //startRow += 5;  ( *1은 String일 경우 강제로 숫자로 계산하기 위함 )
		
							if (replyListTotCnt > replyStartRow) {
								// 댓글 더보기 버튼 화면에 표시
								$("#moreReplyList").show();
		
							} else {
								$("#moreReplyList").hide();
								$("#allReplyList").hide();
							}
		
						} else {
							alert(data.resultMag);
						}
					},
					error : function(xhr, status, error) {
						console.log(xhr);
						alert("error\nxhr : " + xhr + ", status : "
							+ status + ", error : " + error);
					}
				});
			} // end of showNextReplyList()
			
			/**댓글 전체 리스트 보기*/
			function getAllList() {
				$.ajax({
					type : "post",
					url : "/replies/all",
					data : {
						bNo : "${param.bno}"
					},
					dataType : "json",
					success : function(data) {
						console.log(data);
						if (data.result == "ok") {
							// 댓글 리스트 모두 지우고 다시 출력
							$("#replyTable").find("tr").remove();
		
							// 댓글 리스트 출력
							$.each(data.replyAllList, function(i, rDTO) {
								var str = "";
								str += "<tr>";
								str += "<td width='10%'>" + rDTO.replyId + "</td>";
								str += "<td>" + rDTO.rContent + "</td>";
								str += "<td width='20%'>" + rDTO.rRegDate + "</td>";
								str += "<td width='20%'>" + rDTO.rModifyDate + "</td>";
								str += "<td><input type='hidden' id='rNo' value='" + rDTO.rNo + "'/>";
								str += "<input type='hidden' id='rContent' value='" + rDTO.rContent + "'/>";
								
								if(data.loginUserId == rDTO.replyId){
									str += "<button type='button' id='replyDetail'>수정</button>";
								}
								
								str += "</td></tr>"
								
								$("#replyTable").append(str);
							});
		
							// 모든 댓글 리스트 출력 후 댓글 더보기 버튼 숨기기
							$("#moreReplyList").hide();
							$("#allReplyList").hide();
		
						} else {
							alert(data.resultMag);
						}
		
					},
					error : function(xhr, status, error) {
						console.log(xhr);
						alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error);
					}
				});
			} // end of getAllList()
		
			/** 좋아요 체크 */
			function check() {
				var bno = "${boardDTO.bNo}";
				var userId = "${loginSession.userId}";
				$.ajax({
					type : 'get',
					url : '/category/checkFavorite?bno=' + bno + '&userId=' + userId,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					dataType : 'text',
					success : function(result) {
		
						if (result == "SUCCESS") {
							$("#likeImage").attr("src", "/resources/images/like2.png");
							count();
						}
						if (result == "FAIL") {
							$("#likeImage").attr("src", "/resources/images/like1.png");
							count();
						}
					}
				});
			} // end of check()
		
			/** 좋아요 업데이트 */
			function update() {
				var bno = "${boardDTO.bNo}";
				var userId = "${loginSession.userId}";
				$.ajax({
					type : 'get',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					url : '/category/handlingFavorite?bno=' + bno + '&userId=' + userId,
					dataType : 'text',
					success : function(data) {
						/* if(result == "notLogin"){
		              		  	alert("로그인 후 이용하세요 :)");
		               			return;
		              	  	 } */
		
						check();
		
						if (data == "안뇽") {
							console.log("찍히나용?");
						}
					}
				}); // end of ajax from likeBoard Btn Click
		
			} // end of update()
		
			/* 좋아요 갯수 세기 */
			function count() {
				var bno = "${boardDTO.bNo}";
				$.ajax({
					type : 'get',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					url : '/category/countFavorite?bno=' + bno,
					dataType : 'text',
					success : function(data) {
						//data-->likeCount
						$("#likeCount").text(data);
					}
				}); // end of ajax from likeBoard Btn Clicks
			}
			
			/* href 클릭 함수 */
			function hrefFunc(fileName){
				$("#hrefId").attr("target","_blank");
				location.href="/board/displayFile?fileName=" + getImageLink(fileName);
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