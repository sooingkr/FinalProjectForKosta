<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>쪽지 읽기</title>
</head>
<body class="index page-index">

	<!-- START TEAM SECTION -->
	<div class="f-page gray-bkg" id="screen-team">
		<!-- START HEADER -->
		<header class="site-header grey">
			<span class="nav-trigger"> <span class="nav-trigger-inside">
					<span class="nav-trigger-line"></span>
			</span>
			</span>
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
				<div class="col-md-8 col-md-offset-2">
					<h4><span class="glyphicon glyphicon-envelope" style="color: #CC723D;">&nbsp;쪽지 상세보기</span></h4>
					<br><br>
					<table class="table table-bordered">
						<tr>
							<th style="text-align: center;width:20%;background-color: #EAEAEA">보낸사람</th>
							<td>
								 ${NoteVO.userId}</td>
						</tr>
						<tr>
							<th style="text-align: center;background-color: #EAEAEA">받은시간</th>
							<td>
								<fmt:formatDate pattern="yyyy년MM월dd일 (a) hh:mm:ss" value="${NoteVO.date_sender}" />
							</td>
						</tr>
						<tr>
							<th style="text-align: center;background-color: #EAEAEA">읽은시간</th>
							<td>
								<fmt:formatDate pattern="YYYY년MM월dd일  HH:mm:ss" value="${NoteVO.date_receiver}" />
							</td>
						</tr>
						<tr>
							<th style="text-align: center;background-color: #EAEAEA">제목</th>
							<td>${NoteVO.mtitle}</td>
						</tr>
						<tr>
							<th style="text-align: center;height: 200px;background-color: #EAEAEA">내용</th>
							<td>
								${NoteVO.mcontent}
							</td>
						</tr>
					</table>
					<div align = "right">
						<button id="cancelBtn" class="btn btn-default">목록보기</button>
						<button id="delBtn" class="btn btn-danger">삭제</button>
						<button class="btn btn-warning" data-target="#layerpop" data-toggle="modal">답장</button> <br />
					</div>
				</div>
			</div>
		</section>
		<div class="arrow"></div>
	</div>
	<!-- END TEAM SECTION -->


	<!-- 답글 작성시 이용하기위해 만듬 -->
	<input type="hidden" id="sender" value="${NoteVO.userId }" />
	<input type="hidden" id="receiver" value="${NoteVO.recvId}" />

	<form id="form1">
		<input type="hidden" name="mno" value="${NoteVO.mno }" />
	</form>
	

	<!-- 답글달기 모달창 -->
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<center><h3 class="modal-title">답장 보내기</h3></center>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form id="form2">
					<table class="table-bordered" style="width:100%;">
						<h5 align = "right" style="color: navy;">[ from: ${NoteVO.recvId} ]</h5>
						<tr>
							<th style="text-align: center; width: 15%; background-color: #F6F6F6">받는 사람</th>
							<td>
								<input type="text" class="form-control" name="recvId" value="${NoteVO.userId}" readonly="readonly" /></td>
						</tr>
						<tr>
							<th style="text-align: center; background-color: #F6F6F6">제목</th>
							<td><input type="text" class="form-control" name="mtitle" autofocus="autofocus"/></td>
						</tr>
						<tr>
							<th style="text-align: center; background-color: #F6F6F6">내용</th>
							<td><textarea rows="10" cols="50" name="mcontent" class="form-control"></textarea>
							</td>
						</tr>
					</table>
						<br>
						<div align ="right">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button id="sendTo" class="btn btn-warning">보내기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function() {

			var formN = $("#form1");
			// 삭제 버튼 클릭시...

			// 취소버튼 클릭시
			$("#cancelBtn").on("click", function() {
				history.go(-1);
			}); // end of cancelBtn

			$("#delBtn").on("click", function() {
				var result = confirm("삭제하시겠습니까?");
				if(result == true){
					formN.attr("action", "/note/delFromReceiver");
					formN.attr("method", "post");
					formN.submit();
				}
				
			});// end of delBtn

			// 쪽지 답장하기 버튼 클릭시...
			$("#replyBtn").on("click", function() {
				var sender = $("#sender").val();
				var receiver = $("#receiver").val();
				self.location = "/note/replyNoteForm?userId=" + userId
				"+recvId=" + recvId;
			}); // 쪽지 답장하기 클릭

			$("#sendTo").on("click",function(){
				var formName = $("#form2");
				formName.attr("action","/note/replyNote");
				formName.attr("method","POST");
				formName.submit();
			}); // end of sendTo click
		});
	</script>
</body>
</html>

