package com.java.kosta.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.StyleConstants.CharacterConstants;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.user.UserServiceImpl;


@Controller
@RequestMapping("/user/*")
public class UserController {
   @Inject
   UserServiceImpl service;
   
   // 로그인 화면
   @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login(){
        return "/user/login"; 
    }
   
   // 로그인 처리
   @RequestMapping(value="/loginProc", method=RequestMethod.POST)
   @ResponseBody
   public Map<String, Object> loginProcAjax(UserVO vo, HttpServletRequest req) 
   {
      Map<String, Object> resMap = new HashMap<String, Object>();
      //로그인 실패
      resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
      resMap.put(Constants.RESULT_MSG, "아이디와 비밀번호를 확인하세요.");
      
      try {
         UserVO uservo = service.login(vo);
         
         if( uservo != null  && uservo.getUserId().equals(vo.getUserId()) ) {
            //로그인 성공 - 세션에 저장
            req.getSession().setAttribute(Constants.LOGINSESSION, uservo);
            resMap.put(Constants.RESULT, Constants.RESULT_OK);
            System.out.println( uservo.getUserId() +  "로그인 성공!!!!");
            
            return resMap;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return resMap;
   }

   // 회원가입 화면
   @RequestMapping(value = "/subscribeJoin", method = RequestMethod.GET)
   public String subscribeMethod() {
      return "user/subForm"; // 회원가입 폼 호출
   }
   
   // 아이디 중복체크
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam(value = "userId") String userId) {

		Map<String, Object> res = new HashMap<String, Object>();
		res.put(Constants.RESULT, Constants.RESULT_OK);
		res.put(Constants.RESULT_MSG, "사용 가능한 아이디입니다.");
		
		int cnt = service.idCheck(userId);
		
		if (cnt > 0) {
			res.put(Constants.RESULT, Constants.RESULT_FAIL);
			res.put(Constants.RESULT_MSG, "이미 사용중인 아이디입니다.");
		}

		return res;
	}

}