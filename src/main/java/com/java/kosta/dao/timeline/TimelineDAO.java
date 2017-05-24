package com.java.kosta.dao.timeline;

import java.util.List;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

public interface TimelineDAO {
	
	public List<TimelineDTO> listMatch(UserVO vo,PagingDTO pageMaker);
	
	public int countTimeline(UserVO vo);
	
	public int listAll();
}