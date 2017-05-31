<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 
handlebars js ���̺귯�� �߰�
 -->
<script type="text/javascript" src="/resources/js/handlebars-v4.0.10.js"></script>
<title>Insert title here</title>
</head>
<body>
	<!-- 
		handlebars ���ø� �ۼ�
		: script���ο� type�� text/x-handlebars-X ������ �ۼ��Ѵ�. X�κп��� �ڽ��� ���ϴ� ��Ī�� ���� �� �ִ�.
		ex) type="text/x-handlebars-myTemplate"
		handlebars�� ����)
			1. handlebars�� �±׸� �̿��� ���ø��� �����ϰ�
			2. �� ���ø��� �� �����͸� �����ϰ�
			3. ���������� �����͸� ���ø��� �����Ѵ�.
			�̶�, ���ø��� �����Ͱ� �� �ڸ����� {{ }} �� �ȿ� �������� ǥ�����ְ� �ȴ�.
			
			�Ʒ��� ���ø����� {{#users}} {{/users}} �κ��� : users �迭�� ���� ��ü�� ���̰� ���� �ش� ���̸�ŭ �ݺ����� ���Եȴ�.
			������� users={{name:'abc',id:'sooingkr'},{name:'ccc',id:'ddd'}}; ��� users �迭�� ������ 2�� ���鼭 ��Եȴ�.
			
			{{#users}} {{/users}} ���ο� {{name}}, {{id}} �κп��� users �迭�� �� �ε����� ����Ű�� �������� �������ָ� �ȴ�.
	 -->
	<script id="entry-template" type="text/x-handlebars-template">
	<table>
    	<thead> 
        	<th>�̸�</th> 
        	<th>���̵�</th> 
        	<th>�����ּ�</th> 
    	</thead> 
    	<tbody> 
       	 	{{#users}} 
       	 	<tr> 
        	    <td>{{name}}</td> 
            	<td>{{id}}</td> 
            
            {{!-- ����� ���� ������ email�� id�� ���ڷ� �ѱ�� --}}
            	<td><a href="mailto:{{email id}}">{{email id}}</a></td> 
        	</tr> 
        	{{/users}} 
    	</tbody> 
	</table>
	</script>
	<script>
		// [	handlebars �����ϱ�	]
	
		//�ڵ�� ���ø� �����´�.
		var source = $("#entry-template").html(); 
	
		//�ڵ�� ���ø� ������
		var template = Handlebars.compile(source); 
	
		//�ڵ�� ���ø��� ���ε��� ������
		var data = {
		    	users: [
		            { name: "ȫ�浿1", id: "aaa1" },
		            { name: "ȫ�浿2", id: "aaa2" },
		            { name: "ȫ�浿3", id: "aaa3" },
		            { name: "ȫ�浿4", id: "aaa4" },
		            { name: "ȫ�浿5", id: "aaa5" }
		        ]
		}; 
	
		//Ŀ���� ���� ��� (id�� ���ڷ� �޾Ƽ� ��ü �̸��� �ּҸ� ��ȯ)
		// ������ {{email id}} ���� email�κп� id�� ���ڷ� �ѱ�� �Ǵ� ��!
		// �׷� id@daum.net�� ��ȯ�ؼ� ���� ��.
		Handlebars.registerHelper('email', function (id) {
		  return id + "@daum.net";
		});
	
		//�ڵ�� ���ø��� �����͸� ���ε��ؼ� HTML ����
		var html = template(data);
	
		//������ HTML�� DOM�� ����
		$('body').append(html);
	</script>
</body>
</html>