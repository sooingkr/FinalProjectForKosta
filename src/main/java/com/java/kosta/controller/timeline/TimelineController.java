package com.java.kosta.controller.timeline;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.dto.note.NoteVO;
import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.FilterDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.note.NoteService;
import com.java.kosta.service.timeline.TimelineService;

@Controller
public class TimelineController {
	
	@Inject
	TimelineService service;

	Logger logger = LoggerFactory.getLogger(TimelineController.class);

	@Inject
	NoteService noteService;
	// 타임라인 메인으로 이동
	@RequestMapping(value = "/timeline")
	public String timelineMain(HttpServletRequest req, NoteVO vo) throws Exception {
		logger.info("타임라인 폼으로 이동");
		
		HttpSession session = req.getSession();
		UserVO uvo = (UserVO) session.getAttribute("loginSession");
		if(uvo != null){
			logger.info("타임라인 진입때 안읽은 쪽지함 갯수 뿌려줬나");
			vo.setRecvId(uvo.getUserId());
			int NotReadCnt = noteService.totalCntNotOpen(vo);
			session.setAttribute("notOpen", NotReadCnt+"");
		}
		
		return "timeline/timelineMain";
	}

	// 타임라인 리스트 ajax 호출용
	@RequestMapping(value = "/timeline/listPaging")
	public @ResponseBody Map<String, Object> timelineMain(HttpSession session, PagingDTO page,
			@RequestParam("keywords") String keywords, Model model) {
		logger.info("타임라인 리스트 ajax 메서드로 이동");
		UserVO vo = null;
		List<TimelineDTO> list = null;
		// 현재 로그인되어 있는 사용자 객체 가져오기
		vo = (UserVO) session.getAttribute("loginSession");
		logger.info("keywords: " + keywords);
		if (vo != null) {
			page.setTotalCount(service.countTimeline(vo, keywords));
			page.setPerPageNum(5); // 5개씩만 가져오도록...

			// 관심사, 거리에 따른 게시글 목록 가져오기
			list = service.listMatch(vo, page, keywords);

			logger.info("넘어온 값 : keywords : " + keywords + " page : " + page.getPage());
		}
		logger.info("가져온 값 : " + list);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageMaker", page);
		map.put("keywords", keywords);
		return map;
	}// end of timelineMain

	// 필터된 게시글 ajax 호출용
	@RequestMapping(value = "/timeline/filterList")
	public @ResponseBody Map<String, Object> filterList(PagingDTO page,
			@RequestParam(value = "fcateArr") List<String> fcateArr, @RequestParam(value = "fvalue1") String fvalue1,
			@RequestParam(value = "fvalue2") String fvalue2) {
		logger.info("필터 ajax 호출되었습니당^0^");
		FilterDTO filter = new FilterDTO();
		logger.info("fvalue1 : " + fvalue1);
		logger.info("fvalue2 : " + fvalue2);

		/* fvalue1 과 fvalue2의 조건문 : 가치에 따른 분류를 위함 */
		if (!fvalue1.equals("")) {
			filter.setFvalue1(fvalue1);
		} else {
			filter.setFvalue1("0");
		}
		if (!fvalue2.equals("")) {
			filter.setFvalue2(fvalue2);
		} else {
			filter.setFvalue2(Integer.toString(service.maxValue()));
		}

		logger.info("fcateArr : " + fcateArr);

		for (int i = 0; i < fcateArr.size(); i++) {
			if (fcateArr.get(i).equals("true")) {
				fcateArr.set(i, "Y");
			} else
				fcateArr.set(i, "N");
		}
		logger.info("fcateArr Y/N : " + fcateArr);

		/* 카테고리에서 가져와서 필터링 */
		filter.setFcate1(fcateArr.get(0));
		filter.setFcate2(fcateArr.get(1));
		filter.setFcate3(fcateArr.get(2));
		filter.setFcate4(fcateArr.get(3));
		filter.setFcate5(fcateArr.get(4));
		filter.setFcate6(fcateArr.get(5));

		// 페이징을 위한 작업
		page.setTotalCount(service.countFilterList(filter));
		logger.info("필터 전체 수 : " + service.countFilterList(filter));
		page.setPerPageNum(5);
		List<TimelineDTO> list = service.listFilter(filter, page);
		for (int i = 0; i < list.size(); i++) {
			System.out.println("bno : " + list.get(i).getBno() + ", cateId : " + list.get(i).getCateId() + ", value : "
					+ list.get(i).getValue());
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageMaker", page);

		return map;

	}// end of filterList

}// end of class
