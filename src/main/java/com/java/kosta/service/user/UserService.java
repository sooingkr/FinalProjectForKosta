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
	
	// 확인을 위한 회원 패스워드 가져오기
	public UserVO getPwd(UserVO vo);
	
	// 비밀번호 암호화해서 가져오기
	public String encapsulation(String userPw);
	
	public void updateInfo(UserVO vo);
}
