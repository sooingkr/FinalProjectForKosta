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
				<div id="content-frame-mask1" style="right: 17px;"></div>
				<div class="what-row clearfix image-on-left">
					<div class="what-row clearfix image-on-right">
						<div>
							<h4>보낸 쪽지함</h4>
							<table border="1" cellspacing="0" cellpadding="0">
								<tr>
									<th>No</th>
									<th>받는사람</th>
									<th>제목</th>
									<th>보낸날짜</th>
									<th>읽은날짜</th>
								</tr>
								<c:forEach var="NoteVO" items="${list}" varStatus="status">
									<tr id="sel">
										<td>${status.count}</td>
										<td>${NoteVO.recvId}</td>
										<td><a href="/note/readDetail?mno=${NoteVO.mno}">${NoteVO.mtitle}</a></td>
										<td>
											<a href="/note/readDetail?mno=${NoteVO.mno}">
												<fmt:formatDate pattern="(E)YY년MM월dd일 HH:mm:ss" value="${NoteVO.date_sender}"/>
											</a>
										</td>
										<td ${NoteVO.date_receiver == null ? "style='color:red'" : ""} colspan="2">
											<c:if test="${NoteVO.date_receiver == null}">
													${"아직 읽지 않음"}	
											</c:if>
											<c:if test="${NoteVO.date_receiver != null}">
												<fmt:formatDate pattern="(E)YY년MM월dd일 HH:mm:ss" value="${NoteVO.date_receiver}"/>
											</c:if>
											<button style="color:black" id="delBtn" type="button">삭제</button>
										</td>
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
										href="/note/listSend${pageMaker.pageQuery(1)}">[처음]</a>
									</li>
									<c:if test="${pageMaker.prev}">
										<li><a
											href="/note/listSend${pageMaker.pageQuery(pageMaker.startPage-1)}">[이전]</a>
										</li>
									</c:if>
									<!-- [1][2][3]...[10] -->
									<c:forEach var="index" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li ${pageMaker.page == index ? 'class=active' : '' }><a
											href="/note/listSend${pageMaker.pageQuery(index)}">[${index}]</a>
										</li>
									</c:forEach>
									<!-- [다음] -->
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="/note/listSend${pageMaker.pageQuery(pageMaker.endPage+1)}">[다음]</a>
										</li>
									</c:if>
									<!-- [마지막] -->
									<li><a
										href="/note/listSend${pageMaker.pageQuery(pageMaker.entireEndPage)}">[마지막]</a>
									</li>
								</ul>
							</div>
							<!-- 쪽지 페이징 처리 -->

						</div>
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

