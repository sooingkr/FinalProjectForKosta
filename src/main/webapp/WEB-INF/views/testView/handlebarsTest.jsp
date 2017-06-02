<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

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
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  

<!-- 
handlebars js 라이브러리 추가
 -->
<script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
<title>Insert title here</title>
<style>
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

</style>

</head>
<body>

	<!-- 
		handlebars 템플릿 작성
		: script내부에 type을 text/x-handlebars-X 식으로 작성한다. X부분에는 자신이 원하는 명칭을 넣을 수 있다.
		ex) type="text/x-handlebars-myTemplate"
		handlebars의 요점)
			1. handlebars는 태그를 이용한 템플릿을 구성하고
			2. 그 템플릿에 들어갈 데이터를 구성하고
			3. 마지막으로 데이터를 템플릿에 적용한다.
			이때, 템플릿에 데이터가 들어갈 자리에는 {{ }} 이 안에 변수명을 표시해주게 된다.
			
			아래의 템플릿에서 {{#users}} {{/users}} 부분은 : users 배열과 같은 객체의 길이가 들어와 해당 길이만큼 반복문을 돌게된다.
			예를들어 users={{name:'abc',id:'sooingkr'},{name:'ccc',id:'ddd'}}; 라는 users 배열이 있으면 2번 돌면서 찍게된다.
			
			{{#users}} {{/users}} 내부에 {{name}}, {{id}} 부분에는 users 배열의 각 인덱스가 가리키는 변수명을 기재해주면 된다.
	 -->
	 
	 
<script id="entry-template2" type="text/x-handlebars-template">	 
	<ul class="timeline">
  <li class="timeline-event">
    <label class="timeline-event-icon"></label>
    <div class="timeline-event-copy">
      <p class="timeline-event-thumbnail">April 2011 - heute</p>
      <h3>Geil,Danke! GmbH</h3>
      <h4>Geschäftsführerin eines Web-Studios</h4>
      <p><strong>Schwerpunkt: Frontend-Entwicklung</strong><br>Entwickeln von anspruchsvollen, animierten, responsive und adaptive Webseiten mit HTML5, SCSS, jQuery; für alle Browser, optimiert für Desktop, Notebook, Smartphones und Tablets (iOS, Android, Windows).</p>
      <p><strong>Projektmanagement mit Scrum</strong><br>Ständiges Verbessern des agilen Entwicklungsprozesses beispielsweise durch Grunt, Yeoman, GIT, JIRA und BrowserStack.</p>
    </div>
  </li>
  <li class="timeline-event">
    <label class="timeline-event-icon"></label>
    <div class="timeline-event-copy">
      <p class="timeline-event-thumbnail">November 2009 - März 2011</p>
      <h3>Freelancer</h3>
      <h4>Designer und Autor</h4>
      <p>Konzeption, Design und Produktion von Digitalen Magazinen mit InDesign, der Adobe Digital Publishing Suite und HTML5. Co-Autorin der Fachbücher "Digitales Publizieren für Tablets" und "Adobe Digital Publishing Suite" erschienen im dpunkt.verlag.</p>
    </div>
  </li>
  <li class="timeline-event">
    <label class="timeline-event-icon"></label>
    <div class="timeline-event-copy">
      <p class="timeline-event-thumbnail">April 2011 - heute</p>
      <h3>konplan gmbh</h3>
      <h4>IT-Consultant</h4>
      <p><strong>Systemarchitektur, Consulting</strong><br>Konzeption und Modellierung von Systemen und APIs für Digital Publishing und Entitlement nach SOA</p>
    </div>
  </li>
</ul>  
</script> 
	 
	 
	
	<script>
		// [	handlebars 적용하기	]
	
		//핸들바 템플릿 가져온다.
		var source = $("#entry-template2").html(); 
	
		//핸들바 템플릿 컴파일
		var template = Handlebars.compile(source); 
	
		//핸들바 템플릿에 바인딩할 데이터
		var data = {
		    	users: [
		            { name: "홍길동1", id: "aaa1" },
		            { name: "홍길동2", id: "aaa2" },
		            { name: "홍길동3", id: "aaa3" },
		            { name: "홍길동4", id: "aaa4" },
		            { name: "홍길동5", id: "aaa5" }
		        ]
		}; 
	
		//커스텀 헬퍼 등록 (id를 인자로 받아서 전체 이메일 주소를 반환)
		// 위에서 {{email id}} 에서 email부분에 id를 인자로 넘기게 되는 것!
		// 그럼 id@daum.net을 반환해서 들어가게 됨.
		Handlebars.registerHelper('email', function (id) {
		  return id + "@daum.net";
		});
	
		//핸들바 템플릿에 데이터를 바인딩해서 HTML 생성
		var html = template(data);
	
		//생성된 HTML을 DOM에 주입
		$('body').append(html);
	</script>
</body>
</html>