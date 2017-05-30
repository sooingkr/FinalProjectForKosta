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

	// 로그인
	@Override
	public UserVO login(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String userId) {
		return sqlSession.selectOne(NAMESPACE + ".idCheck", userId);
	}
	
	//구글 유니크 아이디 중복체크
	@Override
	public UserVO googlecheckDuplicateId(String uniqId) {
		return sqlSession.selectOne(NAMESPACE+".googlecheckDuplicateId", uniqId);//하나만 반환
	}

	//일반 유저 회원가입
	@Override
	public void insertUser(UserVO vo) {
		 sqlSession.insert(NAMESPACE+".insertUser",vo);
	}

	//구글 유저 회원가입
	@Override
	public void googleinsertUser(UserVO vo) {
		sqlSession.insert(NAMESPACE+".googleinsertUser",vo);
	}

	// 회원 수정 확인을 위해 패스워드 가져오기
	@Override
	public UserVO getPwd(UserVO vo) {
		return sqlSession.selectOne(NAMESPACE+".getPwd",vo);
	}

	@Override
	public void updateInfo(UserVO vo) {
		sqlSession.update(NAMESPACE+".updateInfo",vo);
	}

	@Override
	public String encapsulation(String userPw) {
		return sqlSession.selectOne(NAMESPACE+".encapsulation",userPw);
	}
	
	
}
