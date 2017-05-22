package com.java.kosta.validation;

import java.util.HashMap;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.java.kosta.dto.user.UserVO;

public class validationCheck implements Validator{
	HashMap<String, String> ErrorObj = new HashMap<String,String>();
	
	public validationCheck() {
		// TODO Auto-generated constructor stub
	}
	
	
	public validationCheck(HashMap<String, String> errorObj) {
		super();
		ErrorObj = errorObj;
	}



	@Override
	public boolean supports(Class<?> arg0) {
		return false;
	}

	@Override
	public void validate(Object obj, Errors errors) {
		UserVO check = null;
		String userId = "";
		String userPw = "";
		String userName = "";
		String email = "";
		String address1 = "";
		String tel = "";
		
		if ( obj != null ){
			check = (UserVO)obj;
			userId = check.getUserId();
			userPw = check.getUserPw();
			userName = check.getUserName();
			email = check.getEmail();
			address1 = check.getAddress1();
			tel = check.getTel();
		}
		
		if ( userId == null || userId.equals("") ){
			errors.rejectValue("userId", "아이디를 입력하세요");
			ErrorObj.put("EId", "아이디를 입력하세요");
		}
		if ( userPw == null || userPw.equals("") ){
			errors.rejectValue("userPw", "비밀번호를 입력하세요");
			ErrorObj.put("EPw", "비밀번호를 입력하세요");
		}
		if ( userName == null || userName.equals("") ){
			errors.rejectValue("userName", "이름을 입력하세요");
			ErrorObj.put("EName", "이름를 입력하세요");
		}
		if ( email == null || email.equals("") ){
			errors.rejectValue("email", "이메일를 입력하세요");
			ErrorObj.put("EEmail", "이메일을 입력하세요");
		}
		if ( address1 == null || address1.equals("") ){
			errors.rejectValue("address1", "주소를 입력하세요");
			ErrorObj.put("EAddress", "주소를 입력하세요");
		}
		if ( tel == null || tel.equals("") ){
			errors.rejectValue("tel", "전화번호를 입력하세요");
			ErrorObj.put("ETel", "전화번호를 입력하세요");
		}
		
	}

	public HashMap<String, String> result(){
		return ErrorObj;
	}
}
