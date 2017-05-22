<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>Insert title here</title>
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
                        <h5 style="font-size:30px;" id="hello"><a href="/board/notice/listPaging">공지사항(Notice Board)</a></h5>
                        <button class="button" value="Show map">펼쳐보기</button>
                            <div id="googlemap">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7407.084900169444!2d73.71531610873852!3d21.836602579155294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39601e76cfab0f2f%3A0xde6b6769555c29d9!2sStatue+of+Unity!5e0!3m2!1sen!2sin!4v1457959783722" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                            </div>
                            <!-- 검색 질의 유형 선택 -->
                            <div class="box-body">
                            	<select id="selectSearchType" name="searchType">
                            		<option value="n" ${SearchDTO.searchType == null ? "selected" : '' }>
                            		검색질의 분류
                            		</option>
                            		<option value="t" ${SearchDTO.searchType eq 't' ? "selected" : '' }>
                            			제목
                            		</option>
                            		<option value="c" ${SearchDTO.searchType eq 'c' ? "selected" : '' }>
                            			내용
                            		</option>
                            		<option value="w" ${SearchDTO.searchType eq 'w' ? "selected" : '' }>
                            			글쓴이
                            		</option>
                            		<option value="tc" ${SearchDTO.searchType eq 'tc' ? "selected" : '' }>
                            			제목/내용
                            		</option>
                            		<option value="cw" ${SearchDTO.searchType eq 'cw' ? "selected" : '' }>
                            			내용/글쓴이
                            		</option>
                            		<option value="tcw" ${SearchDTO.searchType eq 'tcw' ? "selected" : '' }>
                            			전체
                            		</option>
                            	</select>
                            	<input type="text" name="keyword" id="keywordId" />
                            	<button id="searchBtn">검색</button>
                            </div>
                            <script type="text/javascript">
                            	$(document).ready(function(){
                            		$("#searchBtn").on("click",function(event){
                            			// 검색어 선택 select 태그의 option 중 selected 된 녀석의 값을 가져옴
                            			var searchType = $("#selectSearchType option:selected").val(); 
                            			var keyword = $("#keywordId").val(); // 키워드를 가져옴
                            			self.location = "/board/notice/listPaging${SearchDTO.pageQuery(1)}&keyword="+encodeURIComponent(keyword)+"&searchType="+searchType;
                            			// 페이징 정보 쿼리문자열에 같이 날려주지 않으면 기본값인 1페이지 10개씩이 선택되서 되어질 것임
                            			// 검색어 처리에 따른 상태 유지를 할 수는 있으나 검색의 경우는 페이지 전환시 상태 유지를 할 필요성을 느끼지 못하여 하지 않고 하겠음
                            		});// end of searchBtn click
                            	});
                            </script>
                       <!-- ---------------------------------------- -->
                     
                     
                     	<!-- 수정,삭제 작업 처리가 완료되었을 경우 메시지를 띄워줌 -->
                       <c:if test="${msg != null}">
                       		<script type="text/javascript">
                       			alert("${msg}");
                       		</script>
                       </c:if>
							                       
                       <table class="table table-bordered">
                       	<tr>
                       		<th style="width:10px">No</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>등록일</th>
							<th>조회수</th>							
                       	</tr>
                       	<c:forEach items="${list}" var="boardVO" varStatus="status">
                       		<tr>
                       			<!-- ${boardVO.bno } 대신 count로 뿌려주세요! -->
                       			<td>${status.count }</td>
                       			<td><a href="/board/notice/read${SearchDTO.makeQuery(SearchDTO.page)}&bno=${boardVO.bno}">
                       				${boardVO.title }
                       			</td>
                       			<td>${boardVO.writer }</td>
                       			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.bregdate }"/>
								<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
                       		</tr>
                       	</c:forEach>
                       </table>
                       <!-- 
                       	[이전][1][2][3]...[10][다음] 부분 작성
                        -->
                       <!-- [이전] -->
                       <div class="text-center">
	                       <ul class="pagination">
	                       		<li>
	                       			<a href="/board/notice/listPaging${SearchDTO.makeQuery(1)}">[처음]</a>
	                       		</li>
		                       <c:if test="${SearchDTO.prev}">
		                       	<li>
		                       		<a href="/board/notice/listPaging${SearchDTO.makeQuery(SearchDTO.startPage-1)}">[이전]</a>
		                       	</li>
		                       </c:if>
		                       <!-- [1][2][3]...[10] -->
		                       <c:forEach var="index" begin="${SearchDTO.startPage}" end="${SearchDTO.endPage}">
		                       	<li ${SearchDTO.page == index ? 'class=active' : '' }>
		                       		<a href="/board/notice/listPaging${SearchDTO.makeQuery(index)}">[${index}]</a>
		                       	</li>
		                       </c:forEach>
		                       <!-- [다음] -->
		                       <c:if test="${SearchDTO.next && SearchDTO.endPage > 0}">
		                       	<li>
		                       		<a href="/board/notice/listPaging${SearchDTO.makeQuery(SearchDTO.endPage+1)}">[다음]</a>
		                       	</li>
		                       </c:if>
		                       	<!-- [마지막] -->
								<li>
									<a href="/board/notice/listPaging${SearchDTO.makeQuery(SearchDTO.entireEndPage)}">[마지막]</a>
								</li>
								<li>
									<span class="dropdown">
									  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
									    출력게시글 수
									    <span class="caret"></span>
									  </button>
									  <ul id="selPerPageNum" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="5">페이지당 5개씩 출력</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="6">페이지당 6개씩 출력</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="7">페이지당 7개씩 출력</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="8">페이지당 8개씩 출력</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="9">페이지당 9개씩 출력</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="10">페이지당 10개씩 출력</a></li>
									    <li role="presentation"><a role="menuitem" tabindex="-1" href="20">페이지당 20개씩 출력</a></li>
									  </ul>
									</span>
								</li>
	                       </ul>
                       </div>
                       <!-- ---------------------------------------- -->
                    </div></div>
                </section>
            </div>
            <!-- END TALK TO US SECTION -->
            
            
      <!-- 각 페이지별 메뉴 색깔 제어와 페이지당 출력 개수 제어-->
<script>
	$(document).ready(function(){
		$("#talktous").attr("class","active");
		
		// 페이지당 출력할 게시글 수가 클릭되었을 때
		$("#selPerPageNum").on("click","li a",function(event){
			event.preventDefault(); // a태그의 화면넘어감을 막음
			var perPageNum = $(this).attr("href"); // 클릭된 a태그의 href 값을 가져옴
			// 출력하고싶은 페이지당 게시글 수를 적용해서 현재화면을 전환함
			var searchInput = $("#keywordId").val();
			self.location="/board/notice/listPaging?page=${SearchDTO.page}&perPageNum="+perPageNum
					+"&searchType=${SearchDTO.searchType}&keyword="+encodeURIComponent(searchInput);
		});
	})
</script>
