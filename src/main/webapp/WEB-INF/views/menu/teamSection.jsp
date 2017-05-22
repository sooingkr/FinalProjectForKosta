<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TeamSection</title>
</head>
<body class="index page-index">
			<div class="f-page yellow-bkg active" />
<!-- START TEAM SECTION -->
            <div class="f-page gray-bkg" id="screen-team">
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
                    <div class="content-frame">    
                    <div id="content-frame-mask1" style="right: 17px;"></div>                
                      <div class="what-row clearfix image-on-left">
                                <div class="what-image">
                                    <div class="screenshot">
                                        <img src="/resources/images/1_team.jpg" alt="thumb">
                                    </div>
                                    <div class="overlay"></div>
                                </div>
                                <div class="what-text">
                                    <h2>John Deo</h2>    
                                    <h4>Manager</h4>   
                                    <div class="what-image-mobile">
                                        <div class="overlay"></div>
                                        <img src="/resources/images/1_team.jpg" alt="thumb">
                                    </div>
                                    <div class="what-excerpt"><p>Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, </p></div>                                    
                                     <div class="faw">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-rss"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a></div>
                                </div>
                            </div>
                            <div class="what-row clearfix image-on-right">
                                <div class="what-image">
                                    <div class="screenshot">
                                        <img src="/resources/images/2_team.jpg" alt="thumb">
                                    </div>
                                    <div class="overlay"></div>
                                </div>
                                <div class="what-text">
                                    <h2>John Deo</h2>                                    
                                     <h4>Web Designer</h4>
                                    <div class="what-image-mobile">
                                        <div class="overlay"></div>
                                        <img src="/resources/images/2_team.jpg" alt="thumb">
                                    </div>
                                    <div class="what-excerpt"><p>Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor. Lorem ipsum dolor sit amet, </p></div>                                    
                                     <div class="faw">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-rss"></i></a>
                                    <a href="#"><i class="fa fa-google-plus"></i></a></div>
                                </div>
                            </div>
                    </div>
                </section>
                <div class="arrow">
                </div>
            </div>
            <!-- END TEAM SECTION -->
<script>
	$(document).ready(function(){
		$("#team").attr("class","active");
	})
</script>
</body>
</html>