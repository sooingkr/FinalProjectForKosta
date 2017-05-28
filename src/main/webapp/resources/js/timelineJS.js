$(document).ready(function(){
	var page = 1;
	var keywords;
	
	function listAll(pageNum,searchText){
		var str = "";
		$.getJSON("/timeline/listPaging?page="+pageNum+"&keywords="+encodeURIComponent(searchText),function(data){
			var bno = "";
			var temp = "";
			var userId = "${loginSession.userId}";
			$(data.list).each(function(){
				bno = this.bno;
				str += "<li id='timelineList'>"
					+"<div class='well well-lg'>"
						+"<div class='label label-danger'>카테고리</div>"
						+"<div class='well well-sm'>"
							+"<span>"+ this.cateName +"</span>"
							+"<span class='time' style='font-size:15px;float:right'>"
							+"<i class='glyphicon glyphicon-time'></i> 등록일 : "+this.bregdate
							+"</span>"
						+"</div>"
						
						+"<div class='label label-warning'>거리</div>"
						+"<div class='well well-sm'>"
						+"<span>"+ (this.distance) +"km</span>"
						+"</div>"
					
						+"<div class='label label-warning'>제목</div>"
						+"<div id='bnoWell' class='well well-sm'>"
							+"<h3 class='timeline-header'>No.<strong>"+this.bno+"</strong> - "+this.btitle
								
							+"</h3>" 
						+"</div>"
						
						+"<div class='label label-warning'>글쓴이</div>"
						+"<div class='well well-sm'>"
							+ "<span id='user'>"+this.userId+"</span>"
						+"</div>"
						+"<div class='label label-warning'>내용</div>"
						+"<div id='pan' style='background-color:#FFFFFF;'>"
							+"<div class='panel-body'>"+this.bcontent+"</div>"
							+"<div>"
								+"<button id='likeBtn'>"
									+"<img id='likeImage' src='' style='width:10px;height:10px;' />"
									+"<span id='likeCount'></span>"
								+"</button>"
							+"</div>"
						+"</div>"
					+"</div>"
				+"</li>";
			});// end of each
			
			$("#showTimeline").append(str);
			$("#searchId").val(searchText);
		});
	} // end of listAll()
	
	// 전체 검색 버튼 클릭
	$("#searchBtn").on("click",function(event){
		var searchText = $("#searchId").val();
		page = 1;
		keywords = searchText;
		$("#showTimeline").empty();
		listAll(page,keywords);
	});
	
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

