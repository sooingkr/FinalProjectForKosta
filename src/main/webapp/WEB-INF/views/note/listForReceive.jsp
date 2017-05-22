<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
<style type="text/css">
	A:link{text-decoration:none; color:blue;}
	A:visited{text-decoration:none; color:gray;}
	A:active{text-decoration:none; color:blue;}
	A:hover{text-decoration:none; color:blue;}
</style>
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
							<h4>받은 쪽지함</h4>
							<table width="100%" border="1" cellspacing="0" cellpadding="0">
								<tr>
									<th>No</th>
									<th>보낸사람</th>
									<th>제목</th>
									<th colspan="2">보낸날짜</th>
								</tr>
								<c:forEach var="NoteVO" items="${list}" varStatus="status">
									<tr id="sel" ${NoteVO.recv_read eq 'Y' ? "style='color:gray'":"style='color:blue'"}>
										<td><a href="/note/readDetail?mno=${NoteVO.mno}">${status.count}</a></td>
										<td><a href="/note/readDetail?mno=${NoteVO.mno}">${NoteVO.userId}</a></td>
										<td><a href="/note/readDetail?mno=${NoteVO.mno}">${NoteVO.mtitle}</a></td>
										<td colspan="2">
											<a href="/note/readDetail?mno=${NoteVO.mno}"><fmt:formatDate value="${NoteVO.date_sender}" pattern="(E) YY년MM월dd일 HH:mm:ss"/></a>
											<button id="delBtn" type="button">삭제</button>
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
										href="/note/listReceive${pageMaker.pageQuery(1)}">[처음]</a>
									</li>
									<c:if test="${pageMaker.prev}">
										<li><a
											href="/note/listReceive${pageMaker.pageQuery(pageMaker.startPage-1)}">[이전]</a>
										</li>
									</c:if>
									<!-- [1][2][3]...[10] -->
									<c:forEach var="index" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li ${pageMaker.page == index ? 'class=active' : '' }><a
											href="/note/listReceive${pageMaker.pageQuery(index)}">[${index}]</a>
										</li>
									</c:forEach>
									<!-- [다음] -->
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="/note/listReceive${pageMaker.pageQuery(pageMaker.endPage+1)}">[다음]</a>
										</li>
									</c:if>
									<!-- [마지막] -->
									<li><a
										href="/note/listReceive${pageMaker.pageQuery(pageMaker.entireEndPage)}">[마지막]</a>
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
				//var mno = $(this).parent().value();
				var mno = $(this).parent().next().val();
				self.location="/note/delFromReceiver?mno="+mno;
			}); // end of delBtn click
		})
	</script>
</body>
</html>

