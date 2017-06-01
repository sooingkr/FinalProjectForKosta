package com.java.kosta.controller.timeline;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.FilterDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.timeline.TimelineService;

@Controller
public class TimelineController {
	
	@Inject
	TimelineService service;

	Logger logger = LoggerFactory.getLogger(TimelineController.class);
	
	// 타임라인 메인으로 이동
	@RequestMapping(value="/timeline")
	public String timelineMain(){
		logger.info("타임라인 폼으로 이동");
		return "timeline/timelineMain";
	}
	
	// 타임라인 리스트 ajax 호출용
	@RequestMapping(value="/timeline/listPaging")
	public @ResponseBody Map<String,Object> timelineMain(HttpSession session,PagingDTO page,@RequestParam("keywords") String keywords,Model model){
		logger.info("타임라인 리스트 ajax 메서드로 이동");
		UserVO vo = null;
		List<TimelineDTO> list = null;
		// 현재 로그인되어 있는 사용자 객체 가져오기
		vo = (UserVO) session.getAttribute("loginSession");
		logger.info("keywords: " + keywords);
		if ( vo != null){
			page.setTotalCount(service.countTimeline(vo,keywords));
			page.setPerPageNum(5); // 5개씩만 가져오도록...
			
			// 관심사, 거리에 따른 게시글 목록 가져오기
			list = service.listMatch(vo,page,keywords);
			
			logger.info("넘어온 값 : keywords : " + keywords + " page : " + page.getPage());
		}
		logger.info("가져온 값 : " + list);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("pageMaker", page);
		map.put("keywords", keywords);
		return map;
	}//end of timelineMain
	
	//필터된 게시글 ajax 호출용
		@RequestMapping(value="/timeline/filterList")
		public String filterList(PagingDTO page, String fvalue1, String fvalue2){
//		public @ResponseBody Map<String, Object> filterList(PagingDTO page, String fcateArr[], String fvalue1, String fvalue2){
			logger.info("필터링된 타임라인 리스트 ajax 메서드로 이동");
			FilterDTO filter = new FilterDTO();
			String fcateArr[] = new String[6];
			fvalue1 = "";
			fvalue2 = "";
			/* fvalue1 과 fvalue2의 조건문 : 가치에 따른 분류를 위함 */
			if(!fvalue1.equals("")){
				filter.setFvalue1(fvalue1);
			}else{
				filter.setFvalue1("0");
//				logger.info(filter.getFvalue1());
			}
			if(!fvalue2.equals("")){
				filter.setFvalue2(fvalue2);
			}else{
				filter.setFvalue2(Integer.toString(service.maxValue()));
//				logger.info(filter.getFvalue2());
			}
			
			for(int i=0; i<=5; i++){
				if(i==1 || i==4){
					fcateArr[i] = "Y";
				}
				else fcateArr[i] = "N";
			}//임시로 cate값을 넣어줌
			
			/* 카테고리에서 가져와서 필터링 */
			filter.setFcate1(fcateArr[0]);
			filter.setFcate2(fcateArr[1]);
			filter.setFcate3(fcateArr[2]);
			filter.setFcate4(fcateArr[3]);
			filter.setFcate5(fcateArr[4]);
			filter.setFcate6(fcateArr[5]);
			
			page.setTotalCount(service.countFilterList(filter));	
			page.setPerPageNum(5);
			List<TimelineDTO> list = service.listFilter(filter, page);
			logger.info("가져온 값 : " + list);
			HashMap<String,Object> map = new HashMap<String,Object>();
			map.put("list", list);
			map.put("pageMaker", page);
			
			return "timeline/timelineMain";
//			return map;
			
		}//end of filterList
	
	
}//end of class
