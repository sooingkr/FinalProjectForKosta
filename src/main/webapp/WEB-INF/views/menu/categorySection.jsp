<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>Portfolio Section</title>
<html>
<body>
<!-- START PORTFOLIO SECTION -->
            <div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;" >
                <!-- START HEADER -->
                <header class="site-header grey">
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
                <section class="site-content full-height">
                    <div class="content-frame" id="content-frame">    
                    <div id="content-frame-mask" style="right: 17px;"></div>                
                      <div class="wrapper">
                      <!-- START CONTAINER-->
	                    <div class="container">
		                    <div id="three-columns" class="grid-container">
			                    <ul class="rig columns-3 gallery2">
                                <!-- START ITEM -->
				                    <li><a href="/board/category/boardList?cateId=2">
					                    <img src="/resources/images/thumb/001.jpg" alt="Portfolio"/></a>
					                        <h3><a href="/board/category/boardList?cateId=1&pageNo=1">도서/음반</a></h3>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/board/category/boardList?cateId=3">
					                    <img src="/resources/images/thumb/002.jpg" alt="Portfolio"/></a>
					                        <h3><a href="/board/category/boardList?cateId=2&pageNo=1">뷰티/패션/잡화</a></h3>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/board/category/boardList?cateId=4">
					                    <img src="/resources/images/thumb/003.jpg" alt="Portfolio"/></a>
					                        <h3><a href="/board/category/boardList?cateId=3&pageNo=1">애완동물용품</a></h3>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/board/category/boardList?cateId=5">
					                    <img src="/resources/images/thumb/004.jpg" alt="Portfolio"/></a>
					                        <h3><a href="/board/category/boardList?cateId=4&pageNo=1">홈인테리어/주방/생활용품</a></h3>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/board/category/boardList?cateId=6">
					                    <img src="/resources/images/thumb/005.jpg" alt="Portfolio"/></a>
					                        <h3><a href="/board/category/boardList?cateId=5&pageNo=1">유아/취미/완구</a></h3>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/board/category/boardList?cateId=7">
					                    <img src="/resources/images/thumb/006.jpg" alt="Portfolio" /></a>
					                        <h3><a href="/board/category/boardList?cateId=6&pageNo=1">지역할인쿠폰</a></h3>
				                    </li>   
                                <!-- END ITEM -->                 				
			                    </ul>
		                    </div>
	                    </div>
	                <!-- END CONTAINER-->
                    </div>
                    </div>
                </section>
                <div class="arrow">
                </div>
            </div>
            <!-- END PORTFOLIO SECTION -->
            <script>
				$(document).ready(function(){
					$("#portfolio").attr("class","active");
				})
</script>
</body>
</html>
<!-- 메뉴 각 페이지마다 색깔 제어 -->

               		
