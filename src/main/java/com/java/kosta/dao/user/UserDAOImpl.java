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
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}
}
