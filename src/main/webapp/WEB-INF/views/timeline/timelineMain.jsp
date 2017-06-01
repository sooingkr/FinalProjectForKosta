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
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   
    <script type="text/javascript" src="/resources/js/timelineJS.js"></script>
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
                <a id="talktous" href="/noticeBoardSection?">Notice</a>
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
								<input type="checkbox" name="checkbox" id="cateId1" value="n">유아/취미/완구
							</label> 
							<label class="checkbox-inline"> 
								<input type="checkbox" name="checkbox" id="cateId2" value="n">뷰티/패션/잡화
							</label> 
							<label class="checkbox-inline"> 
								<input type="checkbox" name="checkbox" id="cateId3" value="n">애완동물 용품
							</label> 
							<br /> <br /> 
							
							<label class="checkbox-inline"> 
								<input type="checkbox" name="checkbox" id="cateId4" value="n">인테리어/주방/생활용품 
							</label>
							<label class="checkbox-inline"> 
								<input type="checkbox" name="checkbox" id="cateId5" value="n">도서/음반 
							</label>
							<label class="checkbox-inline"> 
								<input type="checkbox" name="checkbox" id="cateId6" value="n">지역 할인 쿠폰
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
							<select class="form-control">
								<option>선택하세요</option>
								<option>0</option>
								<option>10,000원 ~ 30,000원</option>
								<option>30,000원 ~ 50,000원</option>
								<option>50,000원 ~ 70,000원</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	</div>

	</header>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>Page Title</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat hendrerit feugiat. In cursus nisl id arcu ullamcorper, eget euismod ante tincidunt. Cras placerat facilisis semper. Nam vel nisl sit amet justo interdum luctus. Mauris eu felis pretium velit mollis molestie. Nam aliquet a tellus ut pretium. Pellentesque fermentum nulla tempus mauris sagittis, eget imperdiet quam tristique. Pellentesque quis mauris mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sodales turpis fringilla ligula rutrum, eget mattis justo bibendum. Integer imperdiet mi non cursus bibendum. Nullam vitae cursus justo. Integer quis elit sit amet arcu pellentesque <a href="http://www.google.com">google</a> sit amet a sapien. Aliquam tincidunt felis eget quam euismod cursus. Suspendisse lobortis ut elit vitae rhoncus. Ut tincidunt, ante eu egestas sodales, dui nulla aliquet mi, a eleifend lacus risus sit amet lacus.</p>
            </div>
            <div class="col-sm-12">
            	<h3><span class="glyphicon glyphicon-tasks" style="color: #CC723D;">&nbsp;Timeline</span></h3>
				<p><ul id="showTimeline"></ul></p>
            </div>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="/resources/js/bootstrap.offcanvas.js"></script>


</body>

</html>