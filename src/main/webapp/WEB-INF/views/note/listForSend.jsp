<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<head>
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
				<div class="col-sm-8 col-sm-offset-2">
					<h4><span class="glyphicon glyphicon-envelope" style="color: #CC723D;">&nbsp;보낸 쪽지함</span></h4>
						<br><br>
							<table class="table">
								<tr style="background-color: #FFA800">
									<th style="text-align: center;">No</th>
									<th style="text-align: center;">받는사람</th>
									<th style="text-align: center; width:40%;">제목</th>
									<th style="text-align: center;">보낸날짜</th>
									<th style="text-align: center;">읽은날짜</th>
									<th style="text-align: center;">삭제</th>
								</tr>
								<c:if test="${empty list}">
									<tr>
										<td colspan="6" style="text-align: center">보낸 쪽지가 없습니다.<td>
									</tr>
								</c:if>
								<c:forEach var="NoteVO" items="${list}" varStatus="status">
									<tr>
										<td style="text-align: center;">${status.count}</td>
										<td style="text-align: center;">${NoteVO.recvId}</td>
										<td style="text-align: center;"><a href="/note/readDetail?mno=${NoteVO.mno}">${NoteVO.mtitle}</a></td>
										<td style="text-align: center;">
											<a href="/note/readDetail?mno=${NoteVO.mno}">
												<fmt:formatDate pattern="YY년MM월dd일 " value="${NoteVO.date_sender}"/>
											</a>
										</td>
										<td style="text-align: center;" ${NoteVO.date_receiver == null ? "style='color:red'" : ""}>
											<c:if test="${NoteVO.date_receiver == null}">
													${"아직 읽지 않음"}	
											</c:if>
											<c:if test="${NoteVO.date_receiver != null}">
												<fmt:formatDate pattern="YY년MM월dd일 " value="${NoteVO.date_receiver}"/>
											</c:if>
										</td>
										<td style="text-align: center;"><button class="btn btn-link" id="delBtn" type="button">삭제</button></td>
										
										<input id="mnoId" type="hidden" value="${NoteVO.mno}" />
									</tr>
								</c:forEach>
							</table>
							
							<!-- 
                       	[이전][1][2][3]...[10][다음] 부분 작성
                        -->
							<!-- [이전] -->
							<div class="text-center">
								<ul class="pagination">
									<li><a
										href="/note/listSend${pageMaker.pageQuery(1)}">처음</a>
									</li>
									<c:if test="${pageMaker.prev}">
										<li><a
											href="/note/listSend${pageMaker.pageQuery(pageMaker.startPage-1)}">◀</a>
										</li>
									</c:if>
									<!-- [1][2][3]...[10] -->
									<c:forEach var="index" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li ${pageMaker.page == index ? 'class=active' : '' }><a
											href="/note/listSend${pageMaker.pageQuery(index)}">${index}</a>
										</li>
									</c:forEach>
									<!-- [다음] -->
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="/note/listSend${pageMaker.pageQuery(pageMaker.endPage+1)}">▶</a>
										</li>
									</c:if>
									<!-- [마지막] -->
									<li><a
										href="/note/listSend${pageMaker.pageQuery(pageMaker.entireEndPage)}">마지막</a>
									</li>
								</ul>
							</div>
							<!-- 쪽지 페이징 처리 -->
					</div>
				</div>
		</section>
		<div class="arrow"></div>
	</div>
	<!-- END TEAM SECTION -->
	<script>
		$(document).ready(function() {
			$("#sel td").on("click","#delBtn",function(){
				var mno = $(this).parent().next().val();
				self.location="/note/delFromSender?mno="+mno;
			}); // end of click delBtn
		})
	</script>
</body>
</html>

