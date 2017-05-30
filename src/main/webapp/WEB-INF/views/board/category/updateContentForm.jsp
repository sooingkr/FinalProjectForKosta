<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>${cateDTO.cateName}</title>
	<script type="text/javascript" src="/resources/js/fileupload.js"></script>
	<style>
		.fileDrop{
			width: 90%;
			height: 200px;
			border:2px dotted blue;
			border-radius:10px;
			background-color:white;
			margin:auto;
		}
		
		small{
			margin-left:3px;
			font-weight:bold;
			color: grey;
		}
		small:hover{
			color:red;
		}
	</style>
</head>
<body class="index page-index">
	<!-- START TALK TO US SECTION -->
	<div class="f-page gray-bkg active" id="screen-about" style="background-color:#f8f8f8;" >
		<!-- START HEADER -->
		<header class="site-header grey"> 
			<span class="nav-trigger">
			<span class="nav-trigger-inside"> 
			<span class="nav-trigger-line"></span></span></span> 
			<!-- START NAVIGATION MENU --> 
			<%@include file="/WEB-INF/views/layout/navigationImport.jsp"%>
			<!-- END NAVIGATION MENU --> 
			<!-- START SOCIAL ICON --> 
			<%@include file="/WEB-INF/views/layout/socialIconImport.jsp"%>
			<!-- END SOCIAL ICON --> 
		</header>
		<!-- END HEADER -->
	<section class="site-content full-height">
		<div class="content-frame">
			<div id="form-contact" >
				<h1 id="hello">${cateDTO.cateName}</h1>
				<form id="updateForm" action="/board/category/updateContentProc" method="post">
					<table class="table table-bordered">
						<tr>
							<th style="width: 20%">카테고리</th>
							<td>${cateDTO.cateName}<input type="hidden" name="cateId" value="${boardDTO.cateId}"/></td>
						</tr>
						<tr>
							<th style="width: 20%">작성자</th>
							<td>${boardDTO.userId}<input type="hidden" name="userId" value="${boardDTO.userId}"/></td>
						</tr>
						<tr>
							<th style="width: 20%">제목</th>
							<td><input id="bTitle" style="width: 100%; border: 0;" type="text" name="bTitle" value="${boardDTO.bTitle}" required="required"/></td>
						</tr>
						<tr>
							<th style="width: 20%">내용</th>
							<td><textarea id="bContent" name="bContent" rows="100" style="width: 100%; border: 0;" required="required">${boardDTO.bContent}</textarea></td>
						</tr>
						<tr>
							<th style="width:20%"> 상품가치</th>
							<td><input style="width:200px; text-align: right; " type="text" id="value" name="value"  value="${boardDTO.value}" required placeholder="숫자로 입력"/> 원</td>
						</tr>
						<tr>
							<th colspan = "2" style="text-align:center">
								&nbsp;&nbsp;&nbsp; 업로드할 파일을 여기에 끌어다 놓아주세요 (이미지파일 : jpg/png/gif)만 가능
								<div class="fileDrop">
									<c:forEach var="fileName" items="${fileList}">
									<span>
										<a id="hrefId" href="javascript:hrefFunc('${fileName}')" target="_blank" >
										<img src="/board/displayFile?fileName=${fileName}"></img></a>
										<small data-src="${fileName}">X</small>
									</span>
									</c:forEach>
								</div>
							<th/>
						</tr>
					</table>
					<table align="center">
					<tr><td>
						<input type="hidden" name="bNo" value="${boardDTO.bNo}" />
						<!-- <button type="button" onclick="checkUpdate();" >수정하기</button> -->
						<input type="submit" value="수정하기"/>
						<button type="button" onclick="javascript:history.back();">취소</button>
					</td></tr>
					</table>
				</form>


			</div>
		</div>
	</section>
	<script type="text/javascript">
		/* validation 사용해서 검사해야함.... */
		/* function checkUpdate(){
			var form = document.getElementById("updateForm");
			var content = document.getElementById("bContent").value;
			var title = document.getElementById("bTitle").value;
			var value = document.getElementById("value").value;		// 상품가치 (정규표현식을 위해 가져옴)
			
			if( content.trim() == "" || title.trim() == "" ){
				alert("제목과 내용은 필수 입력사항입니다.");
				return;
			}
			var pattern = /^[0-9]*$/;	// 정규표현식 숫자만
			if(value.trim() == "" || !pattern.test(value)){
				alert("상품가치는 숫자만 입력 가능합니다.");
				return;
			}
			form.action="/board/category/updateContentProc";
			form.method="post";
			alert("게시글 수정이 완료되었습니다.");
			form.submit();
		} */ 
		
		$("#updateForm").submit(function(event){
			event.preventDefault ? event.preventDefault() : (event.returnValue = false);
			console.log("updateForm");
			var that = $(this);	//updateForm
			var title = $("#bTitle").val();		// 제목	(빈 값 검사하기 위해)
			var content = $("#bContent").val();	// 내용
			var value = $("#value").val();		// 상품가치 (정규표현식을 위해 가져옴)
			
			if(title.trim() == "" || content.trim() == ""){		// trim() 앞,뒤 공백 제거
				alert("제목과 내용은 필수 입력사항입니다.");
				return;
			}
			
			var pattern = /^[0-9]*$/;	// 정규표현식 숫자만
			if(value.trim() == "" || !pattern.test(value)){
				alert("상품가치는 숫자만 입력 가능합니다.");
				return;
			}
			var str = "";
			
			//fileDrop 클래스의 samll 태그 각각의 값을 가져와서 str에 input hidden 속성으로 붙임 value = file fullName
			$(".fileDrop small").each(function(index){
				str += "<input type='hidden' name='files' value='" + $(this).attr("data-src") +"'>";
			});
			that.append(str);
			that.action="/board/category/updateContentProc";
			that.method="post";
			alert("게시글 작성이 완료되었습니다.");
			that.get(0).submit();	// get(0) : 순수 DOM 객체를 얻어냄
			
		});
		
		/* Ajax 업로드 방식 */
		$(".fileDrop").on("dragenter dragover", function(event){
			//event.preventDefault();	//기본 동작 막음 => 파일 끌어다 놓아도 아무 동작 하지않음
			event.preventDefault ? event.preventDefault() : (event.returnValue = false);	//브라우저에서 지원을 막은 경우
					
		});
				
		$(".fileDrop").on("drop", function(event){
			event.preventDefault ? event.preventDefault() : (event.returnValue = false);
					
			var files = event.originalEvent.dataTransfer.files;	// DOM 이벤트를 가져와서 전달된 파일 데이터를 가져옴
			var file = files[0];
			if(!checkImageType(file.name)){
				alert("이미지 파일(jpg/png/gif)만 업로드 가능합니다.");
				return;
			}
			
			var formData = new FormData();
			formData.append("file", file);	//<form> 태그와 동일한 전송받식으로 파일 데이터 전송 (file 객체 생성)
			
			/* for(int i=0; i<files.length(); i++){
				formData.append("file", files[i]);
			} */
					
			$.ajax({
				url: '/board/uploadAjax',
				data: formData,
				dataType: 'text',
				processData:false,	// query string을 변환하지 않음
				contentType: false,	// multipart/form-data 방식으로 전송하기 위해 false로 지정
				type: 'POST',
				success: function(data){
					
					var str="";
					
					if(checkImageType(data)){
						str = "<span>" +
							"<a href='/board/displayFile.do?fileName=" + getImageLink(data) + "' target='_blank'>" +
							"<img src='/board/displayFile.do?fileName=" + data + "' border='1px'/></a>" + 
							"<small data-src=" + data + ">X</small></span>&nbsp;";
					}/* else {
						str="<span><a href='/board/displayFile.do?fileName=" + data + "'>" + getOriginalName(data) + "</a><small data-src=" + data + ">X</small></span>";
					} */
					
					//$(".uploadedList").append(str);
					$(".fileDrop").append(str);
				}
			});
			
		});
		
		/* 파일 삭제 */
		$(".fileDrop").on("click", "small", function(event){
			var that = $(this);		//this = small태그
			console.log("small");
			console.log(that.attr("data-src"));
			$.ajax({
				url:"/board/deleteFile",
				type:"post",
				data: {
					fileName : that.attr("data-src")
				},
				dataType:"text",
				success:function(data){
					console.log(data);
					if(data == "deleted"){
						that.parent("span").remove();
					}
				}
			});
		});
		
		/* href 클릭 함수 */
		function hrefFunc(fileName){
			$("#hrefId").attr("target","_blank");
			location.href="/board/displayFile?fileName=" + getImageLink(fileName);
		}
	</script>
	<script>
		$(document).ready(function(){
			$("#portfolio").attr("class","active");
		})
	</script>
</div>
</body>
</html>