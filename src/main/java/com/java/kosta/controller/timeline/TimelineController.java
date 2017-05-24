package com.java.kosta.controller.timeline;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.timeline.TimelineService;

@Controller
public class TimelineController {
	
	@Inject
	TimelineService service;

	Logger logger = LoggerFactory.getLogger(TimelineController.class);
	
	@RequestMapping(value="/timeline")
	public String timelineMain(UserVO vo){
		
		vo.setLat("37.480335");
		vo.setLon("126.881231");
		vo.setCateId1("N");
		vo.setCateId2("Y");
		vo.setCateId3("N");
		vo.setCateId4("N");
		vo.setCateId5("Y");
		vo.setCateId6("N");
		vo.setCateId7("N");
		
		List<TimelineDTO> list = service.listMatch(vo);
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
		
//		logger.info("갯수 : " + service.listAll());
//		logger.info("확인 : " + list);
//		model.addAttribute("timelineList", list);
		
		return "/";
	}//end of timelineMain
	
}//end of class
