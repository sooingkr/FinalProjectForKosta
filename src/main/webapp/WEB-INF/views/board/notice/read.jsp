<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>게시글 조회</title>

<!-- 댓글 수정폼에 대한 css -->
<style>
	#modDiv{
		width:300px;
		height:100px;
		background-color:gray;
		position:absolute;
		top:50%;
		left:50%;
		margin-top: -50px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1000;
	}
</style>

 <!-- START TALK TO US SECTION -->
           <div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;">
                <!-- START HEADER -->
                <header class="site-header yellow">
                <span class="nav-trigger">
                    <span class="nav-trigger-inside">
                        <span class="nav-trigger-line"></span>
                    </span>
                </span>
                <!-- START NAVIGATION MENU -->
                
			 <%@include file="/WEB-INF/views/layout/navigationImport.jsp" %>
                
                <!-- END NAVIGATION MENU -->
                <!-- START SOCIAL ICON -->
			 <%@include file="/WEB-INF/views/layout/socialIconImport.jsp" %>
                <!-- END SOCIAL ICON -->
            </header>
                <!-- END HEADER -->
                <section class="site-content full-height"><div class="content-frame"> 
                    <div id="form-contact">
                        <h1 style="font-size:30px;" id="hello"><a href="/board/notice/listPaging">공지사항</a></h1>
                        <button class="button" value="[ 댓글 작성하기 ]">[ 댓글 작성하기 ]</button>
                            <div id="googlemap">
                            	<hr/><hr/>
								<div class="box box-success">
									<div class="box-header">
										<h3 class="box-title">댓글 달기</h3>
									</div>
									<div class="box-body">
										<!-- 이 부분은 로그인한 세션에서 나중에 가져오도록 작성할 것임 -->
										<label for="newReplyWriter">작성자</label>
										<input class="form-control" type="text" placeholder="ID" id="newReplyWriter" />
										<label for="newReplyText">댓글 내용</label>
										<input class="form-control" type="text" placeholder="댓글 내용" id="newReplyText" />
									</div>
									<div class="box-footer">
										<button type="button" class="btn btn-primary" id="replyAddBtn">등록</button>
									</div>
									<hr/><hr/>
								</div>
                            </div>
                            <script type="text/javascript">
                            	$(document).ready(function(){
                            		 $(".button").on("click", function () {
                            	            $(this).text("[ 댓글 작성하기 ]");
                            	        });
                            	})
                            </script>
                       <!-- ---------------------------------------- -->
                    	
                    	<!-- 게시글 수정, 삭제 등을 할 때 게시글 번호 정보가 넘어가야함으로 전달 -->
                    	<!-- 추가로, 읽기,수정,삭제 작업을하고 게시글 목록으로 다시 돌아갈 때 현재까지 보고 있었던 페이지를 다시 띄워주기위해 page와 perPageNum을 같이 보냄 -->
                    	<form id="formId" role="form" method="post">
                    		<input type="hidden" name="bno" value="${boardVO.bno }" />
                    		<input type="hidden" name="page" value="${SearchDTO.page}" />
                    		<input type="hidden" name="perPageNum" value="${SearchDTO.perPageNum}" />
                    		<input type="hidden" name="searchType" value="${SearchDTO.searchType}" />
                    		<input type="hidden" name="keyword" value="${SearchDTO.keyword}" />
                    	</form>
                    	
                    	<!-- 어차피 전달할 용이 아니라 조회용임으로 form에 넣을 필요가 없음 -->
                    	<div class="box-body">
                    		<div class="form-group">
                    			<label for="exampleInputEmail1">제목</label>
                    			<!-- 글 조회페이지여서 수정은 안되도록 readonly 속성을 준다. -->
                    			<input type="text" name="title" class="form-control" value="${boardVO.title }" readonly="readonly" />
                    		</div>
							<div class="form-group">
								<label for="exampleInputPassword1">내용</label>
								<textarea class="form-control1" name="content" rows="3" readonly="readonly">${boardVO.content }</textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">작성자</label>
								<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly"/>
							</div>
                    	</div>
                    	
                    	<div class="box-footer">
                    		<button id="modifyBtn" type="submit" class="btn btn-warning">수정</button>
                    		<button id="deleteBtn" type="submit" class="btn btn-danger">삭제</button>
                    		<button id="returnBtn" type="submit" class="btn btn-primary">목록으로</button>
                    	</div>
                    	
                    	
                       <!-- ---------------------------------------- -->
                    	<br/><br/>


                    	<!-- 댓글 수정 폼 -->
                    	<div id="modDiv" style="display:none;">
                    		<div class="modal-title">
                    		
                    		</div>
							<div>
								<input type="text" id="replytext" />
							</div>
							<div>
								<button type="button" id="replyModBtn">수정</button>
								<button type="button" id="replyDelBtn">삭제</button>
								<button type="button" id="closeBtn">닫기</button>
							</div>
                    	</div>
                    	<!-- 댓글 목록 영역 -->
                    	<ul class="timeline-item">
                    		<li class="time-label">
                    			<span class="bg-green">
                    				[ 댓글 목록 ]
                    			</span>
                    			<button class="btn btn-warning" type="button" id="repliesDiv">댓글보기</button>
                    		</li>
                    	</ul>

                    	<div class="text-center">
                    		<ul id="replies"> <!-- 댓글 목록 -->
		                    		
                    		</ul>
                    		<ul id="pagination" class="pagination pagination-sm no-margin">
                    			<!-- 페이징 -->
                    		</ul>
                    	</div>
                    </div></div>
                   
                </section>
            </div>
            <!-- END TALK TO US SECTION -->
            <!-- 수정,삭제,목록으로 버튼 클릭시 할 동작 정의 -->
       
             <script type="text/javascript">
             	
             	var replyPage = 1; // 현재 페이지(전역변수 선언)
             	$(document).ready(function(){
             		
             		
             		
             		var formN = $("#formId");
	            	$("#modifyBtn").on("click",function(event){
	            		$("#test").val(formN.attr("id"));
	            		formN.attr("action","/board/notice/modify");
	            		formN.attr("method","GET");
	            		formN.submit();
	            	});// end of modifyBtn
	            	
	            	$("#deleteBtn").on("click",function(event){
                		// 삭제 버튼 클릭시
                		formN.attr("action","/board/notice/delete");
                		formN.attr("method","post"); // 삭제는 따로 폼이 필요 없으니까 post로해서 바로 처리되도록
                		formN.submit(); // 전송
                	}); // end of deleteBtn
                	
                	$("#returnBtn").on("click",function(event){
                		// 목록가기 버튼 클릭시
    					// 목록가기의 경우 form의 bno값이 전달될 필요가 없다. 오히려 전달시 이상해질 수 있음
    					// 따라서 그냥 현재 창에서 목록가기 url을 호출하면 됨 폼 전달하지 않고
    					// 현재창에서 다른 창 이동하는 jquery 명령어는 self.location
    					self.location="/board/notice/listPaging${SearchDTO.makeQuery(SearchDTO.page)}"; // 현재창을 목록가기 창으로 이동
                	}); // end of returnBtn
                	
                	
                	// 전체 댓글 목록 출력 부분
                	
                	function getPageList(page){
                		$.getJSON("/replies/${boardVO.bno}/notice/"+page,function(data){
                			console.log(data.list.length);
                			var str = "";
                			
                			$(data.list).each(function(){
                				str+="<li data-rno='"+this.rno+"' class='replyLi'>"
                					+ this.rno + ":" + this.replytext + "&nbsp;&nbsp;&nbsp;<i class='fa fa-clock-o'></i>" + this.regdate + "<button>수정</button></li>";
                			
                			})
                			$("#replies").html(str);
                			
                			// 페이징
                			printPaging(data.pageMaker);
                			
                		});
                	} // end of getPageList()
                 	
                	function printPaging(pageMaker){
                		var str = "";
                		if(pageMaker.prev){ // [ 이전 ]
                			str+="<li><a href='"+(pageMaker.startPage-1)+"'> [이전]</a></li>";
                		}
                		// [1][2][3]...
                		for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
                			var strClass = pageMaker.page == i ? 'class=active':'';
                			str+="<li "+strClass+"><a href='"+i+"'>" + [ i ] + "</a></li>";
                		}
                		if(pageMaker.next){//[ 다음 ]
                			str+="<li><a href='"+(pageMaker.endPage+1)+"'>[다음]</a></li>";
                		}
                		$("#pagination").html(str);
                	}
                	 
                 	$("#pagination").on("click","li a",function(event){
                		event.preventDefault(); // 화면 전환을 막음
                		replyPage = $(this).attr("href"); // a태그의 href값을 가져옴
                		// replyPage는 최초에는 jquery 처음 부분에
                		// 1로 세팅해났음 페이지 클릭시 값 변경
                		getPageList(replyPage); // 댓글 목록 호출
                	}); // end of 페이지
    
                	          	
					$("#repliesDiv").on("click",function(){
						getPageList(replyPage);
					}); // 댓글보기 클릭
                	 
                	// 댓글 등록 클릭했을 때
                	$("#replyAddBtn").on("click",function(){
                		// 입력한 댓글 값들을 가져옴
                		var replyer = $("#newReplyWriter").val();
                		var replytext = $("#newReplyText").val();
                		var bno = "${boardVO.bno}";
                		
                		$.ajax({
                			type : "post",
                			url : "/replies/notice",
                			headers : {
                				"Content-Type" : "application/json",
                				"X-HTTP-Method-Override" : "POST"
                			},
                			dataType : "text",
                			data : JSON.stringify({
                				bno : bno,
                				replyer : replyer,
                				replytext : replytext
                			}),
                			success : function(result){
                				if ( result == "SUCCESS" ){
                					alert("등록되었습니다.");
                					getPageList(1);// 등록처리 후 갱신된 목록을 보여주기 위해서...
                				}
                			}
                		}); // end of ajax
                		// 댓글 입력란 초기화 및 다시 접기
                		$("#googlemap").slideToggle("slow");
                		$("#newReplyWriter").val("");
                		$("#newReplyText").val("");
                	}); // end of 댓글등록 클릭
                	
                	// 댓글 옆 수정버튼 클릭시
                	$("#replies").on("click",".replyLi button",function(event){
                		var reply = $(this).parent(); // 눌린 버튼의 부모 태그를 가져옴 : li 태그
                		var rno = reply.attr("data-rno"); // li 태그의 data-rno 속성 값을 가져옴 : 즉, 댓글의 rno
						var replytext = reply.text();
                		
                		// 댓글 수정 버튼을 클릭했을 때, 수정폼에 해당 정보가 미리 입력되어 있을 수 있도록 세팅.
                		$(".modal-title").html(rno);
                		$("#replytext").val(replytext);
                		$("#modDiv").show("slow");
                		
                	});// end of 댓글 수정 버튼 클릭
                	
                	// 댓글 삭제 버튼 클릭시
                	$("#replyDelBtn").on("click",function(){
                		var rno = $(".modal-title").html();
                		var replytext = $("#replytext").val();
                		
                		$.ajax({
                			type:'delete',
                			url : '/replies/' + rno,
                			headers : {
                				"Content-Type" : "application/json",
                				"X-HTTP-Method-Override" : "DELETE"
                			},
                			dataType : "text",
                			success : function(result){
                				if ( result == "SUCCESS" ){
                					alert("삭제되었습니다.");
                					// 삭제가 성공적으로되면 댓글 수정 폼을 다시 hide하고
                					$("#modDiv").hide("slow");
                					// 삭제처리 후 다시 변경된 내용을 갱신한다.
                					getPageList(replyPage);
                				}
                			}
                		}); // end of ajax
                	}); // end of del
                	
                	// 댓글 수정버튼 클릭시
                	$("#replyModBtn").on("click",function(){
                		var rno = $(".modal-title").html();
                		var replytext = $("#replytext").val();
                		
                		$.ajax({
                			type:'put',
                			url : "/replies/" + rno,
                			headers : {
                				"Content-Type" : "application/json",
                				"X-HTTP-Method-Override" : "PUT"
                			},
                			dataType : "text",
                			data : JSON.stringify({
                				replytext : replytext
                			}),
                			success : function(result){
                				console.log("result : " + result);
                				if ( result == "SUCCESS" ){
                					alert("수정되었습니다.");
                					$("#modDiv").hide("slow");
                					//getAllList();
                					getPageList(1);
                				}
                			}
                		});
                	});// end of replyModeBtn
                	
                	// 댓글 수정 폼 닫기 클릭
                	$("#closeBtn").on("click",function(){
                		// 폼을 다시 안보이게 해줌
                		$("#modDiv").hide("slow");
                	})
             	})// end of jquery
            		    
            </script>
            
            <!-- ------------------------------------------------------------------- -->
            

