package com.java.kosta.controller.user;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.mail.Gmail;
import com.java.kosta.service.user.UserServiceImpl;
import com.java.kosta.validation.validationCheck;

@Controller
@RequestMapping("/user/*")
public class UserController {
	@Inject
	UserServiceImpl service;

	// 회원가입 폼으로 이동 : /user/subscribeForm
	@RequestMapping(value = "/subscribeForm", method = RequestMethod.GET)
	public String subscribeMethod() {
		return "/user/subForm"; // 회원가입 폼 호출
	}

	// 회원가입 처리하기
	@RequestMapping(value = "/subscribeProcess", method = RequestMethod.POST)
	public String subscribeProcess(UserVO dto, String emailCheckFunc, RedirectAttributes rttr, BindingResult errors) {
		System.out.println("확인 : " + dto.toString());
		rttr.addFlashAttribute("UserVO", dto); // 다시 회귀되는 경우 값을 유지시키기 위해 미리 저장해놈.
		String desPath = "";

		// validation 체크하는 부분(빈 문자열 입력 여부)
		validationCheck validation = new validationCheck();
		validation.validate(dto, errors);
		if (errors.hasErrors()) {
			rttr.addFlashAttribute("errors", validation.result());
			return "redirect:/user/subscribeForm";
		}else if (!emailCheckFunc.equals("인증성공")){
			rttr.addFlashAttribute("AUTHCHECK", "FAIL");
			 // 다시 폼으로 넘어갔을 때 지금까지 입력된 값들은
			return "redirect:/user/subscribeForm"; // 다시 입력 폼으로 이동
		}

		// 중복 아이디 체크
		UserVO checkDu = service.checkDuplicateId(dto.getUserId());
		if (checkDu != null) {
			rttr.addFlashAttribute("duplicate", "okay");
			desPath = "redirect:/user/subscribeForm";
		} else {
			service.insertUser(dto); // db에 추가
			desPath = "redirect:/";
			rttr.addFlashAttribute("insertMsg", "success");
		}

		return desPath; // 메인 홈으로 돌려보내기
	} // end of subscribeProcess

}
