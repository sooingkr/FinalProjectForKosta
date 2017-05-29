package com.java.kosta.dao.user;

import com.java.kosta.dto.user.UserVO;

public interface UserDAO {
	// 로그인
	public UserVO login(UserVO vo);
	
	// 아이디 중복체크
	public int idCheck(String userId);
	
	//구글 회원가입시 중복 체크
	public UserVO googlecheckDuplicateId(String uniqId);
	
	//일반유저 insert
	public void insertUser(UserVO vo);
	
	//구글유저 insert
	public void googleinsertUser(UserVO vo);
	
}
