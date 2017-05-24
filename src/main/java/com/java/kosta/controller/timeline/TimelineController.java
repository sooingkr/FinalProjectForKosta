package com.java.kosta.controller.timeline;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.timeline.TimelineService;

@Controller
public class TimelineController {
	
	@Inject
	TimelineService service;

	Logger logger = LoggerFactory.getLogger(TimelineController.class);
	
	@RequestMapping(value="/timeline")
	public String timelineMain(HttpSession session,PagingDTO page){
		
		UserVO vo = null;
		// 현재 로그인되어 있는 사용자 객체 가져오기
		vo = (UserVO) session.getAttribute("loginSession");
		if ( vo != null){
			page.setTotalCount(service.countTimeline(vo));
			page.setPerPageNum(20); // 5개씩만 가져오도록...
			logger.info("너는 누구니?? : " + vo.getUserId());
			
			// 관심사, 거리에 따른 게시글 목록 가져오기
			List<TimelineDTO> list = service.listMatch(vo,page);
			
			for (int i = 0; i < list.size(); i++) {
				System.out.println(
						"bno : "+list.get(i).getBno() + " "+
						"userId : "+list.get(i).getUserId()+" "+
						"btitle : "+list.get(i).getBtitle()+" "+
						"cateId : "+list.get(i).getCateId()+" "+
						"bregdate : "+list.get(i).getBregdate()+" "+
						"distance : "+list.get(i).getDistance()
						);
			}
		}
		
	
		
//		logger.info("갯수 : " + service.listAll());
//		logger.info("확인 : " + list);
//		model.addAttribute("timelineList", list);
		
		return "/";
	}//end of timelineMain
	
}//end of class
