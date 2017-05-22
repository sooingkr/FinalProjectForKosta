<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>aboutSection page</title>


			<!-- START ABOUT SECTION -->
            <div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;">
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
                        <div id="who-text">
                            <h1>THE WHO</h1>
                            <p>Hello there, Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus at sapien eget tellus sodales tempor. Phasellus et varius magna. Ut vulputate ipsum sed dui ullamcorper, nec consequat diam scelerisque. Duis suscipit, lorem non facilisis vulputate, metus eros rutrum ipsum, ac interdum dolor massa sollicitudin lacus. Praesent quis arcu risus. Suspendisse in lacus velit. Praesent non mi a sem ullamcorper bibendum. Nam vel sodales justo, id tincidunt arcu. Etiam volutpat dignissim vestibulum.</p>                            
                            </div>
                        <div id="who-image">
                            <div class="overlay"></div>
                            <img src="/resources/images/dude.png" alt="John Deo">
                        </div>
                    </section>
            </div>
            <!-- END ABOUT SECTION -->
            <!-- 메뉴 각 페이지마다 색깔 제어 -->
<script>
	$(document).ready(function(){
		$("#about").attr("class","active");
	})
</script>




