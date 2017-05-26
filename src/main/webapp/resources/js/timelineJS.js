$(document).ready(function(){
	var page = 1;
	
	function listAll(pageNum){
		var str = "";
		$.getJSON("/timeline/listPaging?page="+pageNum,function(data){
			$(data).each(function(){
			/*	str += "<tr><th>No</th><td>"+this.bno+"</td></tr>"
					+  "<tr><th>제목</th><td>"+this.btitle+"</td></tr>"
					+  "<tr><th>내용</th><td>"+this.bcontent+"</td></tr>"
					+  "<tr><th>조회수</th><td>"+this.viewcnt+"</td></tr>"
					+  "<tr><th>카테고리</th><td>"+this.cateId+"</td></tr>"
					+  "<tr><th>등록일</th><td>"+this.bregdate+"</td></tr>";*/
				str += "<li>"
					+ "<i class='glyphicon glyphicon-thumbs-up btn-lg'></i>"
					+"<div class='well well-lg'>"
						+"<div class='label label-warning'>제목</div>"
						+"<div class='well well-sm'>"
							+"<h3 class='timeline-header'><strong>No. "+this.bno+"</strong> - "+this.btitle
								+"<span class='time' style='font-size:15px;float:right'>"
								+"<i class='glyphicon glyphicon-time'></i> 등록일 : "+this.bregdate
								+"</span>"
							+"</h3>" 
						+"</div>"
						+"<div class='label label-warning'>내용</div>"
						+"<div style='background-color:#FFFFFF;'>"
							+"<a href='#' class='alert-link'>...</a>"
							+"<div class='panel-body'>"+this.bcontent+"</div>"
							+"<div>"
								+"<a class='btn btn-primary btn-xs' data-toggle='modal' data-target='#modifyModal'>수정</a>"
							+"</div>"
						+"</div>"	
					+"</div>"
				+"</li>";
			});
			$("#showTimeline").append(str);
		});
	} // end of listAll()
	
	// 최초, 1페이지 뿌려줌
	listAll(page);
	
	// 무한스크롤 인식
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      console.log("스크롤 인식");
	      page++;
	      listAll(page);
	    }
	});
	
	
	
});