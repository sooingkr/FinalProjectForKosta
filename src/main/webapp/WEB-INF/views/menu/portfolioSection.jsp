<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	 <!-- Responsive -->
<title>Portfolio Section</title>
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
				                    <li><a href="/resources/images/big/001.jpg" class="popup" data-fancybox-group="group2">
					                    <img src="/resources/images/thumb/001.jpg" alt="Portfolio"/></a>
					                        <h3><a target="_blank" href="/board/notice/listPaging">공지사항 게시판</a></h3>
					                        <p>공지사항 게시판 작업중...(롱)</p>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/resources/images/big/002.jpg" class="popup" data-fancybox-group="group2">
					                    <img src="/resources/images/thumb/002.jpg" alt="Portfolio"/></a>
					                        <h3><a target="_blank" href="#">Portfolio Item</a></h3>
					                        <p>Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna.</p>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/resources/images/big/003.jpg" class="popup" data-fancybox-group="group2">
					                    <img src="/resources/images/thumb/003.jpg" alt="Portfolio"/></a>
					                        <h3><a target="_blank" href="#">Portfolio Item</a></h3>
					                        <p>Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna.</p>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/resources/images/big/004.jpg" class="popup" data-fancybox-group="group2">
					                    <img src="/resources/images/thumb/004.jpg" alt="Portfolio"/></a>
					                        <h3><a target="_blank" href="#">Portfolio Item</a></h3>
					                        <p>Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna.</p>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/resources/images/big/005.jpg" class="popup" data-fancybox-group="group2">
					                    <img src="/resources/images/thumb/005.jpg" alt="Portfolio"/></a>
					                        <h3><a target="_blank" href="#">Portfolio Item</a></h3>
					                        <p>Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna.</p>
				                    </li>   
                                <!-- END ITEM -->       
                                 <!-- START ITEM -->
				                    <li><a href="/resources/images/big/006.jpg" class="popup" data-fancybox-group="group2">
					                    <img src="/resources/images/thumb/006.jpg" alt="Portfolio" /></a>
					                        <h3><a target="_blank" href="#">Portfolio Item</a></h3>
					                        <p>Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna.</p>
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
<!-- 메뉴 각 페이지마다 색깔 제어 -->

               		
