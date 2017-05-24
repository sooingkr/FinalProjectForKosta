package com.java.kosta.dao.timeline;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Repository
public class TimelineDAOImpl implements TimelineDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<TimelineDTO> listMatch(UserVO vo,PagingDTO pageMaker) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("UserVO", vo);
		map.put("pageMaker", pageMaker);
		return sqlSession.selectList("timelineMapper.listMatch", map);
	}

	@Override
	public int listAll() {
		return sqlSession.selectOne("timelineMapper.listAll");
	}

	@Override
	public int countTimeline(UserVO vo) {
		return sqlSession.selectOne("timelineMapper.countTimeline", vo);
	}

}
