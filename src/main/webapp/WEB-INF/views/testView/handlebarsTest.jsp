<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 
handlebars js 라이브러리 추가
 -->
<script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
<title>Insert title here</title>
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
	<script id="entry-template" type="text/x-handlebars-template">
	<table>
    	<thead> 
        	<th>이름</th> 
        	<th>아이디</th> 
        	<th>메일주소</th> 
    	</thead> 
    	<tbody> 
       	 	{{#users}} 
       	 	<tr> 
        	    <td>{{name}}</td> 
            	<td>{{id}}</td> 
            
            {{!-- 사용자 정의 헬퍼인 email에 id를 인자로 넘긴다 --}}
            	<td><a href="mailto:{{email id}}">{{email id}}</a></td> 
        	</tr> 
        	{{/users}} 
    	</tbody> 
	</table>
	</script>
	<script>
		// [	handlebars 적용하기	]
	
		//핸들바 템플릿 가져온다.
		var source = $("#entry-template").html(); 
	
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