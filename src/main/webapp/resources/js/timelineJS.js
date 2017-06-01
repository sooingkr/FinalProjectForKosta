$(document).ready(function(){
	var page = 1;
	var keywords;
	var statueFilter = false; //필터를 적용했는지 확인하기 위한 전역변수
	var allData; // 필터조건을 controller에 넘겨주기 위한 전역변수
	
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
						+"</div>"
						
						+"<div class='label label-warning'>거리</div>"
						+"<div class='well well-sm'>"
						+"<span>"+ (this.distance) +"km</span>"
						+"</div>"
					
						+"<div class='label label-warning'>제목</div>"
						+"<div id='bnoWell' class='well well-sm'>"
							+"<h3 class='timeline-header'>No.<strong>"+this.bno+"</strong> - "+this.btitle
								+"<span class='time' style='font-size:15px;float:right'>"
								+"<i class='glyphicon glyphicon-time'></i> 등록일 : "+this.bregdate
								+"</span>"
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
	});
	
	// 최초, 1페이지 뿌려줌
	listAll(page,keywords);
	
	// 무한스크롤 인식
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      console.log("스크롤 인식");
	      page++;
	      if(statueFilter = false){ // 필터가 안된 상태이면 내 관심사에 따라서 타임라인에 뿌려줌
	    	  listAll(page,keywords);
	      }
	      else if(statueFilter = true){// 필터가 적용되면 필터를 계산한 값을 뿌려줌
	    	  listFilter(page,allData);
	      }
	    }
	});//end of 무한스크롤
	
	/** [혜연] 필터된 타임라인 출력 **/
	
	// 1. 버튼을 클릭할때 필터값을 Controller에 넘겨줌
	$("#filterBtn").on("click",function(event){
		page = 1; // 필터링된 타임라인의 page=1 부터 뿌려줘야 하기 때문에 초기화 시켜줌
		statueFilter = true ; // 필터 조건을 설정
		$("#showTimeline").empty(); // 필터결과를 뿌리기 전에 한번 타임라인 창을 비워줌
		$.ajaxSettings.traditional = true;
		/* controller에 넣어줄 각 카테고리 배열 */
		//하나하나 선언해주고 넣지 않으면 출력값이 섞이는 현상이 발생함
		var cate1 = $("#cateId1").is(":checked");
		var cate2 = $("#cateId2").is(":checked");
		var cate3 = $("#cateId3").is(":checked");
		var cate4 = $("#cateId4").is(":checked");
		var cate5 = $("#cateId5").is(":checked");
		var cate6 = $("#cateId6").is(":checked");
		var fcateArr = [cate1, cate2, cate3, cate4, cate5, cate6];
		console.log("fcateArr : "+fcateArr);

		/* 가치의 범위값 가지고 오기 */
		var fvalue1 = document.getElementById("fvalue1").value;
		var fvalue2 = document.getElementById("fvalue2").value;
		console.log("fvalue1 : "+fvalue1);
		console.log("fvalue2 : "+fvalue2);

		/* 필수 필수 */
		allData = {"fcateArr" : fcateArr, "fvalue1" : fvalue1, "fvalue2" : fvalue2, "page" :page};
		console.log("page : "+page);

		listFilter(page,allData); // ajax로 호출
		
	});//end of event( filterBtn )
	
	// 2. 필터된 데이터를 Ajax로 보내고 Controller에서 받아서 내용을 뿌려줌
			function listFilter(pageNum, allData){
				console.log("listFilter실행되었음");
				var str = "";
				
				$.ajax({
					async : false,	
					url : "timeline/filterList",
					type : 'POST',
					dataType : "json",
					data : allData,
					success : function(data){
						//전송 성공 후 실행되는 코드
						console.log("필터된 카테고리 전송 완료");
						
						//
						
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
									+"</div>"
									
									+"<div class='label label-warning'>거리</div>"
									+"<div class='well well-sm'>"
									+"<span>"+ (this.distance) +"km</span>"
									+"</div>"
								
									+"<div class='label label-warning'>제목</div>"
									+"<div id='bnoWell' class='well well-sm'>"
										+"<h3 class='timeline-header'>No.<strong>"+this.bno+"</strong> - "+this.btitle
											+"<span class='time' style='font-size:15px;float:right'>"
											+"<i class='glyphicon glyphicon-time'></i> 등록일 : "+this.bregdate
											+"</span>"
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
						//
						
					},
					error : function(){
						//전송 실패
						alert("전송실패");
						
					}
					
				}); //ajax
			}//end of listFilter
		
	});//end of JS

