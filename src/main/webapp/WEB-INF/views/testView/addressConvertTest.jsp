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
			}, //encodeURIComponent로 인코딩하여 넘깁니다.
			dataType : 'json',
			timeout : 10000,
			cache : false,
			error : function(x, e) {
				alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');
			},
			success : function(data) {
				console.log(data); //결과값이 JSON으로 파싱되어 넘어옵니다.
				var lng = data.result.items[0].point.x; //결과의 첫번째 값의 좌표를 가져옵니다. 상세주소 없이 검색된 경우에는 결과가
				var lat = data.result.items[0].point.y; //여러개로 넘어 올 수 있습니다. 
				console.log("경도 : " + lng); // 경도
				console.log("위도 : " + lat); // 위도
				$("#show").append("위도 : " + lat + "경도 : " + lng);
			}
		});
	}; // end of jusoCallBack() */
	
	jusoCallBack("서울 도봉구 덕릉로59아길 17 (창동, 창동대우아파트)");
</script>
</head>
<body>
	<div id="show">
		
	</div>
</body>
</html>