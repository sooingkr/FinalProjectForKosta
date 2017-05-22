<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 				
	<!-- 			<span>
				<ul class="nav nav-pills" width="100px">
  						<li role="presentation" class="clickable">
  							<a href="/user/subscribeForm" style="font-size:12px">회원가입</a>
  						</li>
  						<li role="presentation" class="clickable">
  							<a href="/user/subscribeForm" style="font-size:12px">로그인</a>
  						</li>
  						<li role="presentation" class="clickable">
  							<a href="/user/subscribeForm" style="font-size:12px">로그아웃</a>
  						</li>
				</ul>  	
				</span> --> 
 				<nav class="social-bar">    
 				
 					<!-- 읽지 않은 쪽지 -->
 					<a href="/note/listNotOpen"><span class="badge bg-red">알림:${sessionScope.notOpen}</span></a>
 				         
 				    <a href="#" class="social-link">
                        <i class="fa fa-twitter"></i>
                    </a>
 				             
                    <a href="#" class="social-link">
                        <i class="fa fa-facebook"></i>
                    </a>
                    
                    
                    <a href="#" class="social-link">
                        <i class="fa fa-google-plus"></i>
                    </a>
                     <a href="#" class="social-link">
                        <i class="fa fa-rss"></i>
                    </a>
                     <a href="#" class="social-link">
                        <i class="fa fa-linkedin"></i>
                    </a>
                     <a href="#" class="social-link">
                        <i class="fa fa-pinterest"></i>
                    </a>
                    
                </nav>
                 