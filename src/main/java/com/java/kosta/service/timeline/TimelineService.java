package com.java.kosta.service.timeline;

import java.util.List;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

public interface TimelineService {

	// 관심사, 거리에 따른 타임라인 게시글 목록 
	public List<TimelineDTO> listMatch(UserVO vo, PagingDTO pageMaker,String keywords);

	// 관심사가 일치하는 전체 게시글 수 출력
	public int countTimeline(UserVO vo,String keywords);

	// 테스트 용도
	public int listAll();

}
