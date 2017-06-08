<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">

.logout { color: black; text-decoration: none;}
a:hover { color: #F78E41; text-decoration: none;}
.msg_a {
		position: relative; 
    	color:white;
    	text-decoration: none;
    	top:-10px;
    	left:-25px;
}
.Badge{
	background-color: #CB1C05;
	border-radius:10px;
	font-weight: bold;
	padding:0 5px 0 5px;
}
 
</style>

 			
	<nav class="social-bar" style="margin-right: 5%;">    
	
		<!-- 로그아웃 -->
		<c:if test="${loginSession.userId != null}">
			<span style="font-weight: bold;">${loginSession.userId} </span> 
			<img class="msg_img" src="/resources/images/message.png"/> 
			<a class="msg_a" href="/note/listReceive">
				<!-- 읽지 않은 쪽지 -->
				<span id="noteBadge" class="Badge" >${sessionScope.notOpen}</span>
			</a>┃ &nbsp;
			<a class="logout" href="/user/Logout" style="font-weight: bold;">로그아웃</a>
		</c:if>
		
		
		<c:if test="${loginSession.userId == null}">
			<span class="glyphicon glyphicon-send" aria-hidden="true" style="height: 50px;">
				<a href="/user/subscribeJoin" style="font-weight: bold;">회원가입</a>
			</span>
		</c:if>
	</nav>
	
	<script>
	$(function(){
	    poll();
	 });
	
	function poll(){
	   setTimeout(function(){
	      $.ajax({
	     	async : false,
	         url : "/note/alarmNote",
	         type : "POST",
	         success : function(totalCnt){
	            console.log("Icon : "+new Date());
// 	            console.log("notOpen값 : "+totalCnt);
	            $("#noteBadge").text(totalCnt);
	//             location.replace("/timeline");
	         },
	         dateType : "json",
	         complete : poll,
	         timeout : 3000
	      });
	   },5000);
	}
</script>
                 