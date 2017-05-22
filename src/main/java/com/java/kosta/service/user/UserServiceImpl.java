package com.java.kosta.service.user;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.user.UserDAOImpl;
import com.java.kosta.dto.user.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAOImpl dao;
	
	// 회원가입 
	@Override
	public void insertUser(UserVO vo) {
		dao.insertUser(vo);
	}

	@Override
	public UserVO checkDuplicateId(String userId) {
		// TODO Auto-generated method stub
		return dao.checkDuplicateId(userId);
	}

}
