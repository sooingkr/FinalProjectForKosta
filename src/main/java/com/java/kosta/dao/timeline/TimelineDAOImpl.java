package com.java.kosta.dao.timeline;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Repository
public class TimelineDAOImpl implements TimelineDAO {
	
	@Inject
	SqlSession sqlSession;

	Logger logger = LoggerFactory.getLogger(TimelineDAOImpl.class);
	
	@Override
	public List<TimelineDTO> listMatch(UserVO vo,PagingDTO pageMaker,String keywords) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("UserVO", vo);
		map.put("pageMaker", pageMaker);
		map.put("keywords", keywords);
		logger.info("dao에서 받은값 : " + keywords);
		return sqlSession.selectList("timelineMapper.listMatch", map);
	}

	@Override
	public int listAll() {
		return sqlSession.selectOne("timelineMapper.listAll");
	}

	@Override
	public int countTimeline(UserVO vo,String keywords) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("UserVO", vo);
		map.put("keywords", keywords);
		return sqlSession.selectOne("timelineMapper.countTimeline", map);
	}

}
