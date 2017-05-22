<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
                        <h1 id="hello">SAY 'HELLO'</h1>
                        <button class="button" value="Show map">SHOW MAP</button>
                            <div id="googlemap">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7407.084900169444!2d73.71531610873852!3d21.836602579155294!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39601e76cfab0f2f%3A0xde6b6769555c29d9!2sStatue+of+Unity!5e0!3m2!1sen!2sin!4v1457959783722" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
                            </div>
                       <!-- ---------------------------------------- -->
                   
						<form name="form1" role="form" action="/board/notice/modify" method="POST">
							
							<input type="hidden" name="page" value="${SearchDTO.page}" />
							<input type="hidden" name="perPageNum" value="${SearchDTO.perPageNum}" />
							<input type="hidden" name="searchType" value="${SearchDTO.searchType}" />
							<input type="hidden" name="keyword" value="${SearchDTO.keyword}" />
							
							<div class="form-group">
								<label for="exampleInputEmail1">BNO</label>
								<!-- 게시글 번호는 절대로 수정할 수 있으면 안됨으로 readonly 속성 주자 -->
								<input type="text" name="bno" class="form-control" value="${boardVO.bno }" readonly="readonly" />
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">제목</label>
								<input type="text" name="title" class="form-control" value="${boardVO.title }" />
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">글쓴이</label>
								<input type="text" name="writer" class="form-control" value="${boardVO.writer }" readonly="readonly" />
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">내용</label>
								<textarea name="content" class="form-control" rows="10" cols="5">${boardVO.content }</textarea>
							</div>
						</form>						                       
	                       
                       <div class="box-footer">
                       	<button id="completeModifyBtn" type="submit" class="btn btn-primary">수정완료</button>
                       	<button id="cancelBtn" type="submit" class="btn btn-warning">취소</button>
                       </div>
                       <!-- ---------------------------------------- -->

                </section>
            </div>
            <!-- END TALK TO US SECTION -->
            
        <!-- 수정완료,취소버튼 클릭시 수행할 부분 -->
		<script type="text/javascript">
			$(document).ready(function(){
				// 폼 잡아오기
				var formName = $("form[name=form1]");
				$("#completeModifyBtn").on("click",function(event){
					// 수정 완료 버튼 클릭시 수정처리하는 컨트롤러로 전송되도록...
					formName.submit();
				}); // end of completeModifyBtn
				
				$("#cancelBtn").on("click",function(event){
					// 취소누르면 바로 뒤로 가기
					history.back();
				}); // end of cancelBtn
			}) // end of jquery
		</script>
