package com.java.kosta.service.user;

import com.java.kosta.dto.user.UserVO;

public interface UserService {
	// 로그인
	public UserVO login(UserVO vo);
	
	// 아이디 중복체크
	public int idCheck(String userId);
	
}
