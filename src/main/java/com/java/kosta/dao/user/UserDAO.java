package com.java.kosta.dao.user;

import com.java.kosta.dto.user.UserVO;

public interface UserDAO {
	// 회원가입 삽입
	public void insertUser(UserVO vo);
	// 회원가입시 중복 아이디 체크
	public UserVO checkDuplicateId(String userId);
}
