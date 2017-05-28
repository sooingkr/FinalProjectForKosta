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
	
}//end of class
