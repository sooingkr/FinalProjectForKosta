package com.java.kosta.dao.timeline;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.java.kosta.dto.timeline.TimelineDTO;
import com.java.kosta.dto.user.UserVO;

@Repository
public class TimelineDAOImpl implements TimelineDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<TimelineDTO> listMatch(UserVO vo) {
		return sqlSession.selectList("timelineMapper.listMatch", vo);
	}

	@Override
	public int listAll() {
		return sqlSession.selectOne("timelineMapper.listAll");
	}

}
