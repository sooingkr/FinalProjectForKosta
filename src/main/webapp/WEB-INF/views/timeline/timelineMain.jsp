<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bootstrap.offcanvas Plugin Example</title>
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
   
   
    <script type="text/javascript" src="/resources/js/timelineJS.js"></script>
    <style>
    	ul{
    	  	 list-style:none;
  			 padding-left:0px;
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
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Another Link <span class="caret"></span></a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu2" role="menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
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

    </header>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>Page Title</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin feugiat hendrerit feugiat. In cursus nisl id arcu ullamcorper, eget euismod ante tincidunt. Cras placerat facilisis semper. Nam vel nisl sit amet justo interdum luctus. Mauris eu felis pretium velit mollis molestie. Nam aliquet a tellus ut pretium. Pellentesque fermentum nulla tempus mauris sagittis, eget imperdiet quam tristique. Pellentesque quis mauris mauris. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent sodales turpis fringilla ligula rutrum, eget mattis justo bibendum. Integer imperdiet mi non cursus bibendum. Nullam vitae cursus justo. Integer quis elit sit amet arcu pellentesque <a href="http://www.google.com">google</a> sit amet a sapien. Aliquam tincidunt felis eget quam euismod cursus. Suspendisse lobortis ut elit vitae rhoncus. Ut tincidunt, ante eu egestas sodales, dui nulla aliquet mi, a eleifend lacus risus sit amet lacus.</p>
            </div>
            <div class="col-sm-12">
            	<h1>Timeline</h1>

				<p>
					<ul id="showTimeline"></ul>
				</p>
                </div>
            <div class="col-sm-12">
                <h1>Page Title</h1>
				<p>
					<ul id="repliesDiv">
					
					</ul>
				</p>
            </div>
        </div>
    </div>

    <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="/resources/js/bootstrap.offcanvas.js"></script>


</body>

</html>