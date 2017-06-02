$(document).ready(function(){
	var page = 1;
	var keywords;
	var login;
	
	function listAll(pageNum,searchText){
		 
	    //핸들바 템플릿 가져온다.
		var source = $("#entry-template2").html(); 
		//핸들바 템플릿 컴파일
		var template = Handlebars.compile(source); 
		// 붙일 녀석을 가져옴
	    var placeHolder = $("#showTimeline");  
		
	    Handlebars.registerHelper('distanceVal', function (distanceVal) {
	    	var distanceUp = Math.ceil(distanceVal);
			  return distanceUp + "m";
		});
	    
	    Handlebars.registerHelper('dateVal', function (dateVal) {
	    	var d = new Date(dateVal);
	    	//var str = dateVal.getFullYear() +" " + (dateVal.getMonth()+1) + " " + dateVal.getDate();
	    	var str = (d.getFullYear() + " " + (d.getMonth()+1) + " " + d.getDate());
	    	return str;
	    });
	    
	    
	    
		$.getJSON("/timeline/listPaging?page="+pageNum+"&keywords="+encodeURIComponent(searchText),function(data){
			var temp = "";
			
			$(data.list).each(function(){
		          var html = template(this);
		          placeHolder.append(html);
		         check(this.bno);
		    });
			
			$("#searchId").val(searchText);
		});
	} // end of listAll()

/*	
	/** 좋아요 체크 상태 확인*/
	function check(bno) {
		console.log("확인" + bno);
		var bno = bno;
		var userId = "${loginSession.userId}";
		console.log("확인2: " + userId);
		$.ajax({
			type : 'get',
			url : '/category/checkFavorite?bno=' + bno + '&userId=' + userId,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "GET"
			},
			dataType : 'text',
			success : function(result) {
				console.log("좋아요 결과 : " + result);
				if (result == "SUCCESS") {
					//$("#img"+bno).attr("src", "/resources/images/like2.png");
					//count();
				}
				if (result == "FAIL") {
					//$("#img"+bno).attr("src", "/resources/images/like1.png");
					//count();
				}
			}
		});
	} // end of check()
	
	
	// 최초, 1페이지 뿌려줌
	listAll(page,keywords);
	
	// 무한스크롤 인식
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      console.log("스크롤 인식");
	      page++;
	      listAll(page,keywords);
	    }
	});
	
	
});

