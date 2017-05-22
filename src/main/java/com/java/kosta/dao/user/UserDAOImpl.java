package com.java.kosta.dao.user;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.user.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	SqlSession sqlSession;
	private final static String NAMESPACE = "UserMapper";
	
	@Override
	public void insertUser(UserVO vo) {
		sqlSession.insert(NAMESPACE+".insertUser", vo);
	}

	@Override
	public UserVO checkDuplicateId(String userId) {
		return sqlSession.selectOne(NAMESPACE+".checkDuplicate", userId);
	}

}
