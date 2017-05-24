package com.java.kosta.service.timeline;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.timeline.TimelineDAO;
import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Service
public class TimelineServiceImpl implements TimelineService {

	@Inject
	TimelineDAO dao;

	@Override
	public List<TimelineDTO> listMatch(UserVO vo, PagingDTO pageMaker) {
		return dao.listMatch(vo, pageMaker);
	}

	@Override
	public int countTimeline(UserVO vo) {
		return dao.countTimeline(vo);
	}

	@Override
	public int listAll() {
		return dao.listAll();
	}

}
