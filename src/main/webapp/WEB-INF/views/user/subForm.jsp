<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- JQuery CDN -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>회원가입 페이지</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen"
	title="no title" charset="utf-8">
<!-- Custom style -->
<link rel="stylesheet" href="css/style.css" media="screen"
	title="no title" charset="utf-8">


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>



<!-- 아이디가 중복인 경우 회원가입 불가하도록 처리(controller에서 한 뒤 메시지 전달) -->
<c:if test="${duplicate eq 'okay' }">
	<script>
		alert("중복된 아이디가 있습니다. 다른 아이디를 입력하세요.");
	</script>
</c:if>
<c:if test="${AUTHCHECK eq 'FAIL'}">
	<script>
		$(document).ready(function() {
			alert("이메일 인증은 필수사항입니다. 이메일 인증을 진행해주세요.");
			$("#userEmail").focus();
		})
	</script>
</c:if>

</head>
<body>

	<article class="container">
		<div class="page-header">
			<h1>
				회원가입 <small>form</small>
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form role="form" id="form1">
				<div class="form-group">
					<label for="InputEmail">아이디</label> <input type="text"
						class="form-control" id="userId" name="userId"
						value="${UserVO.userId }" placeholder="id" required />
					<c:if test="${errors.EId != null }">
						<b>아이디를 입력하세요.</b>
					</c:if>
				</div>
				<div class="form-group">
					<label for="InputEmail">비밀번호</label> <input name="userPw"
						type="password" class="form-control" id="InputPassword1"
						placeholder="password" required />
					<c:if test="${errors.EPw != null }">
						<b>비밀번호를 입력하세요.</b>
					</c:if>
				</div>
				<div class="form-group">
					<label for="InputPassword2">비밀번호 확인</label> <input type="password"
						class="form-control" id="InputPassword2" placeholder="비밀번호 확인">
					<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
				</div>
				<div class="form-group">
					<label for="username">이름</label> <input name="userName"
						value="${UserVO.userName }" type="text" class="form-control"
						id="username" placeholder="이름을 입력해 주세요">
					<c:if test="${errors.EName != null }">
						<b>이름을 입력하세요.</b>
					</c:if>
				</div>

				<div class="form-group">
					<label for="username">성별</label> 남<input name="sex" type="radio"
						style="font-size: 20px" value="남" checked> 여<input
						name="sex" type="radio" style="font-size: 20px" value="여" />
				</div>

				<%-- <div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input name="email" value="${UserVO.email }" type="email"
						class="form-control" id="InputEmail" placeholder="이메일 주소" required>
					<c:if test="${errors.EEmail != null }">
						<b>이메일을 입력하세요.</b>
					</c:if>
				</div> --%>

				<div class="form-group">
					<label for="username">휴대폰 번호</label>
					<div class="input-group">
						<input name="tel" type="tel" value="${UserVO.tel }"
							class="form-control" id="tel" placeholder="- 없이 입력해 주세요">
						<c:if test="${errors.ETel != null }">
							<b>전화번호를 입력하세요.</b>
						</c:if>
					</div>
				</div>

				<div class="form-group">
					<label for="username">이메일</label>
					<div class="input-group">
					 <input name="email" type="text" class="form-control" id="userEmail" value="${UserVO.email }" placeholder="이메일" /> 
						<span class="input-group-btn">
							<button type="button" id="emailCheckBtn" class="btn btn-success">
								인증하기<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
				</div>
				<div id="resultTest"></div>

				<div class="form-group">
					<label for="username">이메일 인증번호</label>
					<div class="input-group">
						<input id="authId" name="authNum" type="text" class="form-control"
							placeholder="이메일 인증번호" /> 
						<span class="input-group-btn">
							<button id="authBtn" class="btn btn-success">
								확인<i class="fa fa-edit spaceLeft"></i>
							</button>
						</span>
					</div>
				</div>
		<!-- 
				 -->
		<div class="form-group">
			<label for="username">우편번호 입력</label>
			<div class="input-group">
				<input type="text" id="sample4_postcode" placeholder="우편번호">
				<input type="button" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기"><br> <input name="address1"
					type="text" value="${UserVO.address1 }" id="sample4_roadAddress"
					placeholder="도로명주소"> <input name="address2" type="text"
					value="${UserVO.address2 }" id="sample4_jibunAddress"
					placeholder="지번주소"> <span id="guide" style="color: #999"></span>
				<c:if test="${errors.EAddress != null }">
					<b>주소을 입력하세요.</b>
				</c:if>
			</div>
		</div>


		<!--  -->
		<div class="form-group">
			<label>약관 동의</label>
			<div data-toggle="buttons">
				<label class="btn btn-primary active"> <span
					class="fa fa-check"></span> <input id="agree" type="checkbox"
					autocomplete="off" checked>
				</label> <a href="#">이용약관</a>에 동의합니다.
			</div>
		</div>

		<div class="form-group">
			<label for="InputEmail">자동로그인 설정 여부 지정</label> 설정<input
				name="useCookie" type="checkbox" id="useCookie">
		</div>

		<!-- 이메일 인증용 -->
		<input id="emailCheck" type="hidden" name="emailCheckFunc" />

		<div class="form-group text-center">
			<button id="subscribeBtn" type="button" class="btn btn-info">
				회원가입<i class="fa fa-check spaceLeft"></i>
			</button>
			<button id="cancelBtn" type="button" class="btn btn-warning">
				가입취소<i class="fa fa-times spaceLeft"></i>
			</button>
		</div>
		</form>
		</div>


	</article>


	<script type="text/javascript">
		$(document).ready(function() {

			// 이메일 인증 버튼 클릭시
			$("#emailCheckBtn").on("click", function(event) {
				var receiverEmail = $("#userEmail").val(); // 입력한 이메일 값을 가져옴.

				var numericExpression = /^[A-Z0-9\._%-]+@[A-Z0-9\.-]+\.[A-Z]{2,4}$/i;
				if ( !receiverEmail.match(numericExpression) ){ // 이메일 형식에 맞지 않으면
					alert("이메일 형식에 맞게끔 작성해 주세요. ex)dudfhd705@gmail.com");
					$("#userEmail").focus();
					return false;
				}
				
				if (receiverEmail == null) {
					alert("인증하려면 이메일을 입력하세요");
					$("#userEmail").focus();
					return false;
				} else { // 이메일을 입력한 경우.
					alert("이메일입력했음");
					$.ajax({
						type : 'post',
						url : '/mailTest?email=' + receiverEmail,
						header : {
							"Content-Type" : "application/json",
							"X-Http-Method" : "post"
						},
						dataType : 'text',
						success : function(data) {
							if (data == receiverEmail) {
								alert("가져오기 성공");
								$("#resultTest").html("<b>인증번호를 입력하세요.</b>");
							}
						}
					}); // end of ajax  
				}

			});

			$("#authBtn").on("click", function(event) {
				var authN = $("#authId").val();
				if ("${authNumVal}" === authN) {
					alert("인증에 성공했습니다.");
					$("#emailCheck").val("인증성공");
				} else {
					alert("인증값이 틀렸습니다. 다시 입력해주세요");
					$("#authNum").focus();
					return false;
				}
			});

			// 회원가입 버튼 클릭시
			$("#subscribeBtn").on("click", function(event) {
				// validation check
				var userPw = $("#InputPassword1");
				var userPw2 = $("#InputPassword2");
				var userEmail = $("#userEmail");
				
				if ( userPw != userPw2 ){
					alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
					$("#InputPassword2").focus();
					return false;
				}
				var numericExpression = /^[A-Z0-9\._%-]+@[A-Z0-9\.-]+\.[A-Z]{2,4}$/i;
				if ( !userEmail.match(numericExpression) ){ // 이메일 형식에 맞지 않으면
					alert("이메일 형식에 맞게끔 작성해 주세요. ex)dudfhd705@gmail.com");
					$("#userEmail").focus();
					return false;
				}
				
				var formId = $("#form1");
				formId.attr("action", "/user/subscribeProcess");
				formId.attr("method", "post");
				formId.submit();
			})
			// 취소버튼 클릭시 가입폼으로 다시 이동
			$("#cancelBtn").on("click", function(event) {
				alert("취소");
				self.location = "/user/subscribeForm";
			})
		});
	</script>

	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
	</script>

</body>
</html>
