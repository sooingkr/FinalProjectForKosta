package com.java.kosta.service.user;

import com.java.kosta.dto.user.UserVO;

public interface UserService {
	// 로그인
	public UserVO login(UserVO vo);
	
	// 아이디 중복체크
	public int idCheck(String userId);
	
	//구글 아이디 체크
	public UserVO googlecheckDuplicateId(String uniqId);
	
	//일반 유저 회원가입
	public void insertUser(UserVO vo);
	
	//구글 회원 유저가입
	public void googleinsertUser(UserVO vo);
	
}
