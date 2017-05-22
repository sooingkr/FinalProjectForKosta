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
				<div id="content-frame-mask1" style="right: 17px;"></div>
				<div class="what-row clearfix image-on-left">
					<div class="what-row clearfix image-on-right">
						<div>
							<h4>쪽지 읽기 페이지</h4>
							<table width="100%" border="1" cellspacing="0" cellpadding="0">
								<tr>
									<th><b><label for="userId">보낸사람</label></b></th>
									<td colpan="2"><input type="text" name="userId" readonly="readonly"
										 value="${NoteVO.userId}" /></td>
								</tr>
								<tr>
									<th><b><label for="date_sender">받은시간</label></b></th>
									<td colpan="2"><fmt:formatDate
											pattern="yyyy년MM월dd일 (a) hh:mm:ss"
											value="${NoteVO.date_sender}" /></td>
								</tr>
								<tr>
									<th><b><label for="date_receiver">읽은시간</label></b></th>
									<td colpan="2"><fmt:formatDate
											pattern="(E) YY년MM월dd일 HH:mm:ss"
											value="${NoteVO.date_receiver}" /></td>
								</tr>
								<tr>
									<th><b><label for="mcontent">내용</label></b></th>
									<td colspan="2"><textarea rows="10" cols="50"
											readonly="readonly">${NoteVO.mcontent}</textarea></td>
								</tr>
								<tr>
									<td colspan="3">
										<button id="delBtn">삭제</button>
										<button id="cancelBtn">취소</button>
										<button class="btn btn-default" data-target="#layerpop"
											data-toggle="modal">답장</button> <br />
									</td>
								</tr>
							</table>
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
	</div>
	</div>
	</div>

	<!-- 답글달기 모달창 -->
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<h4 class="modal-title">답변 쪽지 보내기</h4>
				</div>
				<!-- body -->
				<div class="modal-body">
					<table border="1" cellspacing="0" cellpadding="0">
						<form id="form2">
						<tr>
							<th><label>보내는이</label></th>
							<td><input type="text" name="userId"
								value="${NoteVO.recvId}" readonly="readonly" /></td>
						</tr>
						<tr>
							<th><label>받는이</label></th>
							<td><input type="text" name="recvId"
								value="${NoteVO.userId}" readonly="readonly" /></td>
						</tr>
						<tr>
							<th><label>제목</label></th>
							<td><input type="text" name="mtitle" placeholder="제목" autofocus="autofocus"/></td>
						</tr>
						<tr>
							<th><label>내용</label></th>
							<td><textarea rows="10" cols="50" name="mcontent"></textarea>
							</td>
						</tr>
						<tr>
							<th colspan="2">
								<button id="sendTo">보내기</button>
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							</th>
						</tr>
						</form>
					</table>

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
				alert("삭제 버튼 클릭");
				formN.attr("action", "/note/delFromReceiver");
				formN.attr("method", "post");
				formN.submit();
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

