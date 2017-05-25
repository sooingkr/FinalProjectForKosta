<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">

 a:visited { color: black; text-decoration: none;}
 a:hover { color: #F78E41; text-decoration: none;}
 
</style>

 				
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
 			
 				<nav class="social-bar" style="margin-right: 5%;">    
 				
 				<!-- 로그아웃 -->
				<c:if test="${loginSession.userId != null}">
					<span style="font-weight: bold;">${loginSession.userId} </span> 
					<a href="/note/listNotOpen">
						<!-- 읽지 않은 쪽지 -->
						<span class="badge" style="background-color: #CB1C05;">알림:${sessionScope.notOpen}</span>
					</a>&nbsp; ┃ &nbsp;
					<a href="/user/Logout" style="font-weight: bold;">로그아웃</a>
				</c:if>

				
 				
 				         


					
</nav>
                 