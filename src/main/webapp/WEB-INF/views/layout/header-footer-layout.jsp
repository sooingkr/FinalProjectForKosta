<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<!-- title 설정 안하면 default로 우리조Final Project가 뜨고 입력하면 입력한 내용이 나오게 됨. -->
 <title><decorator:title default="우리조Final Project" /></title>
 
 <!-- META DATA -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<script src="/resources/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="/resources/jquery-3.2.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="/resources/js/login/login.js"></script>

<!-- 공통 CSS -->
<!-- 부트스트랩 -->

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">


    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/css/font-awesome.min.css" />
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<!-- Responsive -->
     <link rel="stylesheet" type="text/css" href="/resources/css/responsive.css"> 
    <!-- PrettyPhoto -->
    <link rel="stylesheet" type="text/css" href="/resources/css/prettyPhoto.css">
    <!-- Fancybox -->
    <link href="/resources/css/jquery.fancybox.css" rel="stylesheet" type="text/css" media="screen">
    <link rel="shortcut icon" href="/resources/images/favicon.ico" />
 <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-73165804-3', 'auto');
        ga('send', 'pageview');

 </script> 

 <!-- 알림을 위한 polling -->
 <script>

    if(${loginSession != null}){
       
//         alert("제 이름은 폴링! 방금 실행되쬬^0^*");
       $(function(){
           poll();
        });
       
       function poll(){
          setTimeout(function(){
             $.ajax({
                url : "/note/alarmNote",
                type : "POST",
                success : function(){
                   console.log(new Date());
                },
                dateType : "json",
                complete : poll,
                timeout : 3000
                
             })
          },5000);
       }
           
     }//if
    
    /* function poll(){ 
       $.ajax({ 
       url: "/note/listNotOpen", 
       success: function(){
       }, 
       dataType: "json", 
       complete: poll, 
       timeout: 10000
       }); 
    } 
    */
 </script>




   
 <decorator:head />
</head>
<body class="index page-index">

	   <!-- 모바일 화면 전환됐을 때 옆 메뉴바 부분 -->
    <nav id="mobile-nav">
        <a href="#welcome">Welcome</a>
        <a href="#about">About Us</a>
        <a href="#portfolio">Portfolio</a>
        <a href="#team">Team</a>
        <a href="#talk-to-us">Talk To US</a>       
    </nav>
      	
  <div id="site-holder">
  
  	<div id="flip" style="padding:0px;" class="container" data-attr-page="0">
	 	
	  		<decorator:body />
 
 	</div>
 	
 </div>
 <!-- END OF div site-holder -->
 
 <!-- JS Plugin -->
   <!-- 공통 JS -->
    <script type="text/javascript" src="/resources/js/jquery.cookie.js"></script>
    <script type="text/javascript" src="/resources/js/mobicom.custom.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.spritely-0.6.8.js"></script>
	<script type="text/javascript" src="/resources/js/jquery-1.9.0.min.js"></script>
    <script src="/resources/js/jquery.fancybox.pack.js" type="text/javascript"></script>
    <script type="text/javascript" src="/resources/js/main.js"></script>

</body>

</html> 

