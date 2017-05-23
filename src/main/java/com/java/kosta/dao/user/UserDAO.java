package com.java.kosta.dao.user;

import com.java.kosta.dto.user.UserVO;

public interface UserDAO {
	// 로그인
	public UserVO login(UserVO vo);
}
