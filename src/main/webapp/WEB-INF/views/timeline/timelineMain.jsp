<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>bootstrap.offcanvas Plugin Example</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.offcanvas.css" />
<link rel="stylesheet" href="/resources/css/exindex.css" />
<script type="text/javascript" src="/resources/jquery-3.2.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/resources/js/timelineJS.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
ul {
	list-style: none;
	padding-left: 0px;
}

h2 {
	text-align: center;
}

.p {
	text-align: center;
	padding-top: 130px;
}
</style>
<style>
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.checkbox-primary input[type="checkbox"]:checked:after {
	color: #337ab7;
}

.checkbox-danger input[type="checkbox"]:checked:after {
	color: #d9534f;
}

.checkbox-info input[type="checkbox"]:checked:after {
	color: #5bc0de;
}

.checkbox-warning input[type="checkbox"]:checked:after {
	color: #f0ad4e;
}

.checkbox-success input[type="checkbox"]:checked:after {
	color: #5cb85c;
}

.checkbox-inline {
	margin-top: 0px;
}

.checkbox input[type=checkbox], input[type="checkbox"] {
	position: absolute;
	visibility: hidden;
	margin-top: 0;
	margin-left: -22px;
}

.checkbox input[type=checkbox]:disabled, input[type="checkbox"]:disabled
	{
	opacity: 0.65;
}

input[type="checkbox"]:checked:after, input[type="checkbox"]:after {
	visibility: visible;
	font-family: FontAwesome;
	display: inline-block;
	color: #333333;
}

input[type="checkbox"]:checked:after:disabled, input[type="checkbox"]:after:disabled
	{
	cursor: not-allowed;
	opacity: 0.65;
}

input[type="checkbox"]:checked:after {
	font-size: 18px;
	content: "\f14a";
}

input[type="checkbox"]:after {
	font-size: 20px;
	content: "\f096";
}
</style>
</head>

<body>

	<header>


	<div class="f-page gray-bkg site-header grey" id="screen-about">
		<!-- START HEADER -->

		<span class="nav-trigger"> <span class="nav-trigger-inside">
				<span class="nav-trigger-line"></span>
		</span>
		</span>
		<nav class="site-menu"> <a id="welcome" href="/">Welcome</a> <a
			id="team" href="/timeline">TimeLine</a> <a id="portfolio"
			href="/categorySection">Category</a> <a id="talktous"
			href="/noticeBoardSection?">Notice</a> <a id="about"
			href="/aboutUsSection">About Us</a> </nav>

	</div>

	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Demo</a>
			<button type="button"
				class="navbar-toggle offcanvas-toggle pull-right"
				data-toggle="offcanvas" data-target="#js-bootstrap-offcanvas"
				style="float: left;">
				<span class="sr-only">Toggle navigation</span> <span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</span>
			</button>
		</div>
		<div class="navbar-offcanvas navbar-offcanvas-touch"
			id="js-bootstrap-offcanvas">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Link</a></li>
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a data-toggle="modal"
					data-target="#basicModal" href="#" class="dropdown-toggle"
					id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="true">관심사 수정<span class="caret"></span></a></li>
			</ul>
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input id="searchId" type="text" class="form-control"
						placeholder="Search">
				</div>
				<button id="searchBtn" type="button" class="btn btn-default">검색</button>
			</form>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Link</a></li>
				<li><a href="#">Another Link</a></li>
			</ul>
		</div>
	</div>
	</nav> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1>Page Title</h1>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin
					feugiat hendrerit feugiat. In cursus nisl id arcu ullamcorper, eget
					euismod ante tincidunt. Cras placerat facilisis semper. Nam vel
					nisl sit amet justo interdum luctus. Mauris eu felis pretium velit
					mollis molestie. Nam aliquet a tellus ut pretium. Pellentesque
					fermentum nulla tempus mauris sagittis, eget imperdiet quam
					tristique. Pellentesque quis mauris mauris. Lorem ipsum dolor sit
					amet, consectetur adipiscing elit. Praesent sodales turpis
					fringilla ligula rutrum, eget mattis justo bibendum. Integer
					imperdiet mi non cursus bibendum. Nullam vitae cursus justo.
					Integer quis elit sit amet arcu pellentesque <a
						href="http://www.google.com">google</a> sit amet a sapien. Aliquam
					tincidunt felis eget quam euismod cursus. Suspendisse lobortis ut
					elit vitae rhoncus. Ut tincidunt, ante eu egestas sodales, dui
					nulla aliquet mi, a eleifend lacus risus sit amet lacus.
				</p>
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


	<div class="modal fade" id="basicModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Basic Modal</h4>
				</div>
				<div class="modal-body">
					<h4>관심사 수정 폼</h4>
					
					<div class="checkbox checkbox-success checkbox-inline">
						<label><input name="checkId1" type="checkbox" class="styled"
							value="option1" checked>도서/음반</label>
						<label><input type="checkbox" class="styled"
							value="option1">뷰티/패션/잡화</label>
						<label><input type="checkbox" class="styled"
							value="option1">애완동물용품
						</label>
						<label><input type="checkbox" class="styled"
							value="option1">홈인테리어/주방/생활용품</label>
						<label><input type="checkbox" class="styled"
							value="option1">유아/취미/완구</label>
							<label><input type="checkbox" class="styled"
							value="option1">지역할인 쿠폰</label>
					</div>
					
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script
		src="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="/resources/js/bootstrap.offcanvas.js"></script>


</body>

</html>