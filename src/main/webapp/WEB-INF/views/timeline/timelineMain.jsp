<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TimeLine</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.offcanvas.css" />
    <link rel="stylesheet" href="/resources/css/exindex.css" />
    <script type="text/javascript" src="/resources/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
     
     <!-- handlebars 추가 -->
     <script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
     
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">   
   <!-- 부가적인 테마 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="/resources/css/font-awesome.min.css" />
    <link rel="shortcut icon" href="/resources/images/favicon.ico" />
  
  
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   
    <script type="text/javascript" src="/resources/js/timelineJS.js?ver=3"></script>
    
    <link rel="stylesheet" href="/resources/css/sidebarCSS.css" />
    <!-- socket 사용을 위해 추가 -->
	<script type="text/javascript" src="/resources/sockjs.min.js"/>    
	<script type="text/javascript" src="/resources/js/json2.js"></script>
<!-- 알림을 위한 polling -->
<script>
 /* 
    if('${loginSession != null}'){
       
       $(function(){
           poll();
        });
       
       function poll(){
          setTimeout(function(){
             $.ajax({
                url : "/note/alarmNote",
                type : "POST",
                success : function(totalCnt){
                   console.log("타임라인 : "+new Date());
//                    console.log("notOpen값 : "+totalCnt);
                   $("#noteBadge").html(totalCnt);
//                    location.replace("/timeline");
                },
                dateType : "json",
                complete : poll,
                timeout : 3000
             });
             
             // 후기를 쓸 게시글 수가 몇개인지를 조회
             $.ajax({
            	 type:'GET',
            	 url:'/mypage/countClient?buyerId=${loginSession.userId}',
            	 success:function(result){
            		 $("#countClientId").html(result);
            	 }
             });
               
             // 후기를 쓸 게시글 수가 몇개인지를 조회
             $.ajax({
            	 type:'GET',
            	 url:'/mypage/countClient?buyerId=${loginSession.userId}',
            	 success:function(result){
            		 $("#countClientId").html(result);
            	 }
             });
          },5000);
       }
           
     }//if
 */
     /*    
     // 롱풀링
     function poll(){ 
    	 // 후기를 쓸 게시글 수가 몇개인지를 조회
         $.ajax({
        	 type:'GET',
        	 url:'/mypage/countClient?buyerId=${loginSession.userId}',
        	dataType:"json",
        	complete:poll,
        	timeout:10000,
        	success:function(result){
        		 $("#countClientId").html(result);
        	 }
         });
    	 
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
 
<script>

    var sock = null;
    $(document).ready(function(){
        sock = new SockJS("/echo-ws");
          sock.onopen=function(){
          }
          sock.onmessage=function(evt){
        	  	alert("테스트 소켓 : " + evt.data);
         	 	console.log("안들어오나?" + evt.data);
               // notifyMe(evt.data); // notification
             /* if(${loginSession.userId eq sessionScope.NotiRecvId}){
             } */
          }
          sock.onclose = function(){
          }      
       
    });
   
  
</script>
<style>
	.msg_a {
		position: relative;
    	top:-10px;
    	left:-25px;
    	text-decoration: none;
	}
	
</style>
</head>

<body>

    <header>
        <div class="f-page gray-bkg site-header grey" id="screen-about">
            <!-- START HEADER -->

            <span class="nav-trigger">
                    <span class="nav-trigger-inside">
                        <span class="nav-trigger-line"></span>
            </span>
            </span>
            <nav class="site-menu">
                <a id="welcome" href="/">Welcome</a>
                <a id="team" style="color:#ffa800;" href="/timeline">TimeLine</a>
                <a id="portfolio" href="/categorySection">Category</a>
                <a id="talktous" href="/noticeBoardSection?pageNo=1&cateId=0">Notice</a>
                <a id="about" href="/aboutUsSection">About Us</a>
            </nav>

        </div>
        
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">통합검색</a>
                    <button type="button" class="navbar-toggle offcanvas-toggle pull-right" data-toggle="offcanvas" data-target="#js-bootstrap-offcanvas" style="float:left;">
                        <span class="sr-only">Toggle navigation</span>
                        <span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                          <span class="icon-bar"></span>
                        </span>
                    </button>
                </div>
                <div class="navbar-offcanvas navbar-offcanvas-touch" id="js-bootstrap-offcanvas">
                   
                    <!-- <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                    </ul> -->
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input id="searchId" type="text" class="form-control" placeholder="Search">
                        </div>
                        <button id="searchBtn" type="button" class="btn btn-default">검색</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right" style="margin-right:3%">
      					<li>
      				    <!--  -->
				        <nav class="social-bar" style="margin-right: 0%;">    
							<!-- 로그아웃 -->
							<c:if test="${loginSession.userId != null}">
								<span style="font-weight: bold;">${loginSession.userId} </span>
								<a class="mypage" href="/mypage/myList"><img src="/resources/images/mypage.png"/></a>
								<img src="/resources/images/message.png"/> 
								<a class="msg_a" href="/note/listReceive">
									<!-- 읽지 않은 쪽지 -->
									<span id="noteBadge" class="badge" style="background-color: #CB1C05;">${sessionScope.notOpen}</span>
								</a>
								<span>거래중인 게시글</span>
								<a id="countClientId" href="/mypage/clientTransactionList?buyerId=${loginSession.userId}"></a>
								&nbsp; ┃ &nbsp;
								<a href="/user/Logout" style="font-weight: bold;">로그아웃</a>
							</c:if>
					    </nav>
                        <!--  -->
      					</li>
      					<li>	
						<c:if test="${loginSession.userId == null}">
							<span class="glyphicon glyphicon-send" aria-hidden="true" style="height: 50px;">
								<a href="/user/subscribeJoin" style="font-weight: bold;">회원가입</a>
							</span>
						</c:if>
      					</li>
                    </ul>
                </div>
            </div>
        </nav>
	</header>

   <div class="col-sm-10 col-sm-offset-1">
      <fieldset class="scheduler-border">
         <legend class="scheduler-border">
            <h4>
               <span class="glyphicon glyphicon-check">&nbsp;검색조건&nbsp;</span>
            </h4>
         </legend>
         <div class="control-group">
            <div class="controls bootstrap-timepicker">
               <div class="form-group" style="float: left; margin-left: 3%; width: 34%;">
                  <span class="glyphicon glyphicon-hand-right" aria-hidden="true">
                     <label class="control-label">관심분야 </label> 
                  </span>
                  <br><br>
                  <span class="input-group" style="margin-left: 4%;"> 
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" id="cateId1" >도서/음반
                     </label> 
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" id="cateId2" >뷰티/패션/잡화
                     </label> 
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" id="cateId3" >애완동물 용품
                     </label> 
                     <br /> <br /> 
                     
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" id="cateId4" >인테리어/주방/생활용품 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" id="cateId5" >유아/취미/완구 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" id="cateId6" >지역 할인 쿠폰
                     </label>
                     
                  </span>
               </div>

               <div class="form-group" style="float: left; margin-left: 3%; width: 40%;">
                  <span class="glyphicon glyphicon-hand-right" aria-hidden="true">
                     <label class="control-label">지역</label> 
                  </span>
                  <br><br>
                  <span class="input-group" style="margin-left: 4%;">
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" value="n">서울 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" value="n">부산 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" value="n">대구 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" value="n">인천 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" value="n">광주 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" value="n">대전 
                     </label>
                     <label class="checkbox-inline"> 
                        <input type="checkbox" name="checkbox" value="n">울산 
                     </label>
                        <br /><br /> 
                        
                     <label class="checkbox-inline">
                        <input type="checkbox" name="checkbox" value="n">경기도
                     </label>
                     <label class="checkbox-inline">
                        <input type="checkbox" name="checkbox" value="n">강원도
                     </label>
                     <label class="checkbox-inline">
                        <input type="checkbox" name="checkbox" value="n">충청도 
                     </label>
                     <label class="checkbox-inline">
                        <input type="checkbox" name="checkbox" value="n">전라도 
                     </label>
                     <label class="checkbox-inline">
                        <input type="checkbox" name="checkbox" value="n">경상도
                     </label>
                     <label class="checkbox-inline">
                        <input type="checkbox" name="checkbox" value="n">제주도 
                     </label>                     
                  </span>
               </div>

               <div class="form-group" style="margin: 1%;">
                  <span class="glyphicon glyphicon-hand-right" aria-hidden="true">
                     <label class="control-label">상품가치 </label> 
                  </span>
                  <br><br>
                  <div class="input-group">
                        <input type="text" style="width: 30%;" id="fvalue1">원
                        ~ 
                        <input type="text" style="width: 30%;" id="fvalue2">원
                     </div>
               </div>
            </div>
         </div>
         <input type="button" id="filterBtn" value="확인"/>
      </fieldset>
   </div>
   
   <div style="position:fixed;left:0px;bottom:20px;color:red;font-size:25px;">
   	<a href="#above">Top</a>
   </div>
   
 <!--   </header> -->

  
    <!-- 사이드바 추가 -->
     <section class="app">
            <aside class="side">
                <ul class="tabs">
                    <li><a href="index.html"><i class="icon-dribbble icon2"></i> Dribbble</a></li>
                    
                    
                    <li class="active"><a href="index.html"><i class="icon-twitter icon2"></i> Twitter</a></li>
                    
                    
                    <li><a href="index.html"><i class="icon-rss icon2"></i> RSS</a></li>
                    
                    
                    <li><a href="index.html"><i class="icon-facebook icon2"></i> Facebook</a></li>
                </ul>
                <a href="index.html" class="add"><i class="icon-plus icon2"></i> Add</a>
            </aside>

			
            <section class="main">
                <article class="item">
                    <p>혜연바보</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic1.png"></a>
                        <a href="index.html">@한혜연</a>
                        <time datetime="2012-04-05T10:30:21+00:00" pubdate>4 minutes ago</time>
                    </footer>
                </article>
                <article class="item">
                    <p>주희는 진짜로 천재같다..</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic3.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:26:27+00:00" pubdate>8 minutes ago</time>
                    </footer>
                </article>
                <article class="item">
                    <p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic2.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:15:45+00:00" pubdate>15 minutes ago</time>
                    </footer>
                </article>
                <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article>
                <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article>
                <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article>
                <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article> <article class="item">
                    <p>Praesent arcu in mauris bibendum id ornare tortor scelerisque.</p>
                    <footer>
                        <a href="index.html" class="avatar"><img src="resources/images/pic4.png"></a>
                        <a href="index.html">@someone</a>
                        <time datetime="2012-04-05T10:14:01+00:00" pubdate>16 minutes ago</time>
                    </footer>
                </article>
            </section>
    </section>
    <!--  -->
    <a name="above"></a>
	<div class="col-sm-10 col-sm-offset-1">  
  
            <div style="border: solid 1px #DDD !important; margin-top: 3%;">
               
            <ul id="showTimeline" class="timeline" style="width:60%;">
            <script id="entry-template2" type="text/x-handlebars-template"> 
                  <li class="timeline-event">
                   <label class="timeline-event-icon"></label>
                   <div class="timeline-event-copy">
                     <p class="timeline-event-thumbnail">{{dateVal bregdate}}</p>
                        <br/>
                     <div class='label label-danger'>카테고리</div>
                     <span><b>{{cateName}}</b></span><br/>
                     <div class='label label-warning'>거리</div>
                     <span><b>{{distanceVal distance}}</b></span><br/>
                     <div class='label label-warning'>금액</div>
                     <span><b>{{value}} 원</b></span>
                     <h2><strong><a href="/board/category/detailContent?bno={{bno}}&pageNo=1">{{btitle}}</a></strong></h2>
                     <i class='glyphicon glyphicon-time'></i> 등록일 : {{bregdate}}<br/><br/>
                     <span><b>{{userId}}</b></span>
            </script> 
              </ul> 
         <!--     <p><ul id="showTimeline"></ul></p>  -->
            </div>
   </div>
   


    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="/resources/js/bootstrap.offcanvas.js"></script>


</body>

</html>