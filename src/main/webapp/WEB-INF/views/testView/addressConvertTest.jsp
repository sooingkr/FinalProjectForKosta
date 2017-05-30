<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/jquery-3.2.1.min.js"></script>
<script>
 	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn) {
		$.ajax({
			type : 'post',
			url : '/address/trans',
			data : {
				'address' : encodeURIComponent(roadFullAddr)
			}, //encodeURIComponent�� ���ڵ��Ͽ� �ѱ�ϴ�.
			dataType : 'json',
			timeout : 10000,
			cache : false,
			error : function(x, e) {
				alert('��û�Ͻ� �۾��� �����ϴ� �� ����ġ �ʰ� �����Ǿ����ϴ�.\n\n�ٽ� �õ��� �ֽʽÿ�.');
			},
			success : function(data) {
				console.log(data); //������� JSON���� �Ľ̵Ǿ� �Ѿ�ɴϴ�.
				var lng = data.result.items[0].point.x; //����� ù��° ���� ��ǥ�� �����ɴϴ�. ���ּ� ���� �˻��� ��쿡�� �����
				var lat = data.result.items[0].point.y; //�������� �Ѿ� �� �� �ֽ��ϴ�. 
				console.log("�浵 : " + lng); // �浵
				console.log("���� : " + lat); // ����
				$("#show").append("���� : " + lat + "�浵 : " + lng);
			}
		});
	}; // end of jusoCallBack() */
	
	jusoCallBack("���� ������ ������59�Ʊ� 17 (â��, â��������Ʈ)");
</script>
</head>
<body>
	<div id="show">
		
	</div>
</body>
</html>