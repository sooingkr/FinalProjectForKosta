package com.java.kosta.service.user;

import com.java.kosta.dto.user.UserVO;

public interface UserService {
	// 사용자 추가
	public void insertUser(UserVO vo);
	// 회원가입 중복 체크
	public UserVO checkDuplicateId(String userId);
}
