package com.java.kosta.service.timeline;

import java.util.List;

import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

public interface TimelineService {
	
	public List<TimelineDTO> listMatch(UserVO vo);
	public int listAll();

}
