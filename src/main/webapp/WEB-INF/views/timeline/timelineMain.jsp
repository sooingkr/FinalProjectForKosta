<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

   
    <script type="text/javascript" src="/resources/js/timelineJS.js?ver=2"></script>
    
    
<style>
	ul {
		list-style: none;
		padding-left: 0px;
	}
	
	fieldset.scheduler-border {
    border: solid 2px #DDD !important;
    padding: 0 10px 10px 10px;
    border-bottom: none;
}

legend.scheduler-border {
    width: auto !important;
    border: none;
    font-size: 14px;
}

<!-- 타임라인 스타일 추가 -->
/* Variables */
/* Fonts */
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,700);
body {
  font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 1.6em;
  font-weight: 300;
  line-height: 1.5;
  letter-spacing: 0.05em;
}

/* Layout */
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

/* Styling */
.timeline {
  margin: 4em auto;
  position: relative;
  max-width: 46em;
}
.timeline:before {
  background-color: black;
  content: '';
  margin-left: -1px;
  position: absolute;
  top: 0;
  left: 2em;
  width: 2px;
  height: 100%;
}

.timeline-event {
  position: relative;
}
.timeline-event:hover .timeline-event-icon {
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
  background-color: #a83279;
}
.timeline-event:hover .timeline-event-thumbnail {
  -moz-box-shadow: inset 40em 0 0 0 #a83279;
  -webkit-box-shadow: inset 40em 0 0 0 #a83279;
  box-shadow: inset 40em 0 0 0 #a83279;
}

.timeline-event-copy {
  padding: 2em;
  position: relative;
  top: -1.875em;
  left: 4em;
  width: 80%;
}
.timeline-event-copy h3 {
  font-size: 1.75em;
}
.timeline-event-copy h4 {
  font-size: 1.2em;
  margin-bottom: 1.2em;
}
.timeline-event-copy strong {
  font-weight: 700;
}
.timeline-event-copy p:not(.timeline-event-thumbnail) {
  padding-bottom: 1.2em;
}

.timeline-event-icon {
  -moz-transition: -moz-transform 0.2s ease-in;
  -o-transition: -o-transform 0.2s ease-in;
  -webkit-transition: -webkit-transform 0.2s ease-in;
  transition: transform 0.2s ease-in;
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
  background-color: black;
  outline: 10px solid white;
  display: block;
  margin: 0.5em 0.5em 0.5em -0.5em;
  position: absolute;
  top: 0;
  left: 2em;
  width: 1em;
  height: 1em;
}

.timeline-event-thumbnail {
  -moz-transition: box-shadow 0.5s ease-in 0.1s;
  -o-transition: box-shadow 0.5s ease-in 0.1s;
  -webkit-transition: box-shadow 0.5s ease-in;
  -webkit-transition-delay: 0.1s;
  transition: box-shadow 0.5s ease-in 0.1s;
  color: white;
  font-size: 0.9em;
  background-color: black;
  -moz-box-shadow: inset 0 0 0 0em #ef795a;
  -webkit-box-shadow: inset 0 0 0 0em #ef795a;
  box-shadow: inset 0 0 0 0em #ef795a;
  display: inline-block;
  margin-bottom: 1.2em;
  padding: 0.25em 1em 0.2em 1em;
}
<!-- 타임라인 스타일 -->
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
                <a id="team" href="/timeline">TimeLine</a>
                <a id="portfolio" href="/categorySection">Category</a>
                <a id="talktous" href="/noticeBoardSection?pageNo=1&cateId=1">Notice</a>
                <a id="about" href="/aboutUsSection">About Us</a>
            </nav>

        </div>
        
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Demo</a>
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
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input id="searchId" type="text" class="form-control" placeholder="Search">
                        </div>
                        <button id="searchBtn" type="button" class="btn btn-default">검색</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Another Link</a></li>
                    </ul>
                </div>
            </div>
        </nav>

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
                        <input type="checkbox" name="checkbox" id="cateId1" >유아/취미/완구
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
                        <input type="checkbox" name="checkbox" id="cateId5" >도서/음반 
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
   
   
	</header>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
            	<h3><span class="glyphicon glyphicon-tasks" style="color: #CC723D;">&nbsp;Timeline</span></h3>
				<ul id="showTimeline" class="timeline">
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
							<h2><strong><a href="/board/category/detailContent?bno={{bno}}">{{btitle}}</a></strong></h2>
							<i class='glyphicon glyphicon-time'></i> 등록일 : {{bregdate}}<br/><br/>
							<span><b>{{userId}}</b></span>
      						<p><strong><pre style="background:#ffffff;border:0px;">{{bcontent}}</pre></strong><br></p><br/>
							<hr/>
							<button type="button" onclick="likeBtnClick({{bno}})" src="/resources/images/like1.png" style="border:0px;background-color:#ffffff;">
								<img id="img{{bno}}" src="/resources/images/like1.png" style="width:15px;height:15px"/>
							</button>
    					</div>
  						</li>
				</script> 
	  			</ul> 
			<!--  	<p><ul id="showTimeline"></ul></p>  -->
            </div>
        </div>
    </div>


    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="/resources/js/bootstrap.offcanvas.js"></script>


</body>

</html>