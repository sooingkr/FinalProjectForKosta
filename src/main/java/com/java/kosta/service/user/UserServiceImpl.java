package com.java.kosta.service.user;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.user.UserDAOImpl;
import com.java.kosta.dto.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAOImpl dao;

	// 로그인
	@Override
	public UserVO login(UserVO vo) {
		return dao.login(vo);
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String userId) {
		return dao.idCheck(userId);
	}
	
}
