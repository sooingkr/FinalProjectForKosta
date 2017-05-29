package com.java.kosta.controller.user;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.user.UserServiceImpl;


@Controller
@RequestMapping("/user/*")
public class UserController {
   @Inject
   UserServiceImpl service;
   
   Logger logger=LoggerFactory.getLogger(UserController.class);
    /*
	 * @method Name : login
	 * @Author : 송아름
	 * @description : 로그인 화면
	 */
   @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login(){
        return "/user/login"; 
    }
   
    /*
	 * @method Name : loginProcAjax
	 * @Author : 송아름
	 * @description : 로그인 비동기 처리
	 */
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
         
         if( uservo != null  && uservo.getUserId().equals(vo.getUserId())) {
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

	/*
	 * @method Name : subscribeMethod
	 * @Author : 송아름
	 * @description : 회원가입 화면
	 */
   @RequestMapping(value = "/subscribeJoin", method = RequestMethod.GET)
   public String subscribeMethod() {
      return "user/join";
   }
   
   
   /*
  	 * @method Name : idCheck
  	 * @Author : 송아름
  	 * @description :  회원가입 시 아이디 중복체크
  	 */
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
  	
  	
  	/**
  	 * 회원가입 비동기처리 [회원가입처리부분]
  	 * 김용래
  	 */

  	@RequestMapping(value = "/join", method = RequestMethod.POST)
  	@ResponseBody
  	public Map<String, Object> joinProc(UserVO vo, HttpServletRequest req,RedirectAttributes redirectattri) {
  		Map<String, Object> res = new HashMap<String, Object>();
//  		logger.info("주소1:"+vo.getAddr1());
//  		logger.info("주소2:"+vo.getAddr2());
//  		logger.info("유니크 아이디:"+vo.getUniqId());
//  		logger.info("유저 아이디:"+vo.getUserId());
  		
  		int cnt = service.idCheck(vo.getUserId());
  		String str=req.getParameter("idCheckboolean");
  		logger.info("체크:"+str);
  		
  		//아이디 중복체크
  		if (cnt > 0) {
  			res.put(Constants.RESULT, Constants.RESULT_FAIL);
  			res.put(Constants.RESULT_MSG, "이미 사용중인 아이디입니다.");
  			return res;
  		}
  		
  		//아이디 체크 버튼을 눌렀는지 안눌렀지 여부
  		else if(str.equals("n")){
  			res.put(Constants.RESULT, Constants.RESULT_FAIL);
  			res.put(Constants.RESULT_MSG,"아이디를 체크를 안눌렀습니다");
  			return res;
  		 }
  		
  		 else if(vo.getUniqId().equals("")){//일반회원가입 고유아이디가 없을때
  			try{
  				service.insertUser(vo);
  				res.put(Constants.RESULT, Constants.RESULT_OK);
  				res.put(Constants.RESULT_MSG,"회원가입 되었습니다");
  			}catch(Exception e){
  				e.printStackTrace();
  				res.put(Constants.RESULT, Constants.RESULT_FAIL);
  				res.put(Constants.RESULT_MSG, "일반회원가입 실패");
  			/*	res.put("userId",vo.getUserId());//유저 아이디
  				res.put("uniqId",vo.getUniqId());//유니크 아이디
  				res.put("userName",vo.getUserName());
  				res.put("email",vo.getUserEmail());
  				redirectattri.addFlashAttribute("UserVO",res);*/
  			}
  			return res;
  			
  		}
  		 else{//구글 회원가입
  	
  			try{
  				service.googleinsertUser(vo);
  				res.put(Constants.RESULT, Constants.RESULT_OK);
  				res.put(Constants.RESULT_MSG,"회원가입 되었습니다");
  			}catch(Exception e){
  				e.printStackTrace();//에러코드 찍는거
  				res.put(Constants.RESULT, Constants.RESULT_FAIL);
  				res.put(Constants.RESULT_MSG, "구글회원 가입 실패");
  			}
  			
  			return res;
  		}
  	}
  	
	/*
	 * @method Name : Logout
	 * @Author : 김용래
	 * @description :  회원 로그아웃
	 */
	@RequestMapping("/Logout")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	   
}