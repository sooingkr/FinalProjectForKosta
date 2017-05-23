<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<title>Welcome Main Page</title>
	
	
            <!-- START WELCOME SECTION -->
            <div class="f-page yellow-bkg active" id="screen-welcome">
                <div id="debugger">
                </div>
                <!-- PRELOADER -->
                <div id="content-loader-holder">
                    <div id="content-loader">
                        <div class="ss-preloader-spin">
                        </div>
                    </div>
                </div>
                <!-- END PRELOADER -->
                <div class="g-screen fixed-screen">
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
                    <!-- START LOGO -->
                    <div class="main-logo">
                        <div class="main-logo-shadow">
                        </div>
                        <div class="logo-img">
                        </div>
						 <div class="logo-arrow"> 
						 	<button type="button" class="btn btn-lg login" data-toggle="modal" data-target="#loginModal">회원 로그인</button>
						 </div>
                    </div>
                    
                    <!-- Modal -->
				      <div class="modal fade" id="loginModal" role="dialog">
				         <div class="modal-dialog">
				            <form class="form center-block" action="/login/loginProc" method="post">
				               <!-- Modal content-->
				               <div class="modal-content">
				                  <div class="modal-header">
				                     <button type="button" class="close" data-dismiss="modal">&times;</button>
				                     <h1 class="text-center">Login</h1>
				                  </div>
				                  
				                  <div class="modal-body">
				                     <div class="form-group">
				                        <input type="text" class="form-control input-lg" placeholder="ID"  id = "userId" name ="userId">
				                     </div>
				                     <div class="form-group">
				                        <input type="password" class="form-control input-lg" placeholder="Password" id ="userPw" name="userPw">
				                     </div>
				                     <div class="form-group form col-md-12">
				                        <span><a href="#">아이디찾기</a></span> / 
				                        <span><a href="#">비밀번호찾기</a></span>
				                        <span style="float: right"><input name="useCookie" type="checkbox" id="useCookie">자동로그인</span>
				                     </div>
				                  </div>
				                  <br />
				                  <div class="modal-footer">
				                     <div class="col-md-12">
				                        <a href="/user/subscribeJoin" class="btn btn-info">회원가입</a> 
				                        <input type="button" class="btn btn-warning"  id="login" value="로그인" />
				                     </div>
				                  </div>
				               </div>
				            </form>
				         </div>
				      </div>
                    <!-- END LOGO -->
                    
                    <!-- START FLUBBER -->
                    <div class="flubber">
                        <div id="flubber" class="flubber-guy">
                            <div class="flubber-eyes">
                            </div>
                        </div>
                        <ul class="flubber-quote">
                            <li>안녕하세요. 반갑습니다.</li>
                            <li>kosta에서하는 마지막 프로젝트입니다.</li>
                            <li>다들 조금만 더 힘냅시다. 화이팅!</li>
                        </ul>
                    </div>
                    <!-- END FLUBBER -->
                    <div class="main-quote">
                        " FAILURE IS NOT AN OPTION, IT IS A REQUIREMENT "</div>
                </div>
            </div>
            <!-- END WELCOME SECTION -->


<!-- START ABOUT SECTION -->
            <div class="f-page gray-bkg" id="screen-about">
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
		$("#welcome").attr("class","active");
	})
</script> 


