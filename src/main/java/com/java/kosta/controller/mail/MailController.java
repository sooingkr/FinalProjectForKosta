package com.java.kosta.controller.mail;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.dto.mail.MailDTO;
import com.java.kosta.service.mail.Gmail;

@Controller
public class MailController {

	@RequestMapping(value="/mailTest",method=RequestMethod.POST)
	public String testMail(String email,HttpSession session){
		String authNum = "";
		for(int i=0; i<6; i++){
			int n = (int)(Math.random()*10);
			authNum += n; // 랜덤값으로 인증번호 생성
		}
		System.out.println("넘어온 값 : " + email);
		session.removeAttribute("authNumVal"); // 기존값을 지우고
		session.setAttribute("authNumVal", authNum); // 메일로 인증번호 전송 전에 세션에 인증번호 저장해 놓음
		
		Gmail g = new Gmail();
		// 제목,받는사람,내용 을 전달해 해당 내용으로 메일 전송
		g.sendMail("회원가입 인증번호 발송입니다.",email,"인증번호 : [" + authNum + "]");
		return authNum;
	}
}
