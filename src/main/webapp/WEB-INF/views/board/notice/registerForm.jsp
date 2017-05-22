<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
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
                        <!-- ------------------------------------------------------------ -->
                        <form id="contactform" action="/board/notice/register" method="POST">
							<!-- 카테고리는 숨김값으로 보내자. -->
							<input type="hidden" name="bcategory" value="notice" />
							<div>
								<label for="titleLabel">제목</label>
								<input type="text" name="title" placeholder="제목을 입력하세요" />
							</div>
							<div>
								<label for="ContentLabel">내용</label>
								<textarea name="content" rows="15" cols="8" placeholder="내용을 입력하세요">
								</textarea>
							</div>
							<div>
								<!-- 이 부분은 추후에 세션에서 id 가져와 입력되 있도록 수정 -->
								<label for="WriterLabel">글쓴이</label>
								<input type="text" name="writer" placeholder="글쓴이를 입력하세요" />
							</div>
							<div>
								<input type="submit" value="등록" />
							</div>
						</form>
                    <!-- ----------------------------------------------------- -->   
                </section>
            </div>
            <!-- END TALK TO US SECTION -->
            
            
      <!-- 각 페이지별 메뉴 색깔 제어 -->
<script>
	$(document).ready(function(){
		$("#talktous").attr("class","active");
	})
</script>
