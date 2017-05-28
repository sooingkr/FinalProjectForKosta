package com.java.kosta.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.java.kosta.dto.user.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	/*
	 * @Author : 황영롱
	 * @description : 로그인 인터셉터 처리
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 얻기
		HttpSession session = request.getSession();
		
		// 로그인 처리 전에 기존 세션에 저장되어 있던 로그인 정보를 제거해줌.
		if ( session.getAttribute("loginSession") != null ){
			logger.info("이전 로그인 세션 제거");
			session.removeAttribute("loginSession");
		}
		// 인터셉터를 거쳐 컨트롤러로 보내야함으로 true 리턴
		return true;
	} // end of preHandle()

	
	/*
	 * @Author : 황영롱
	 * @description : 로그인 처리 후 본래 요청했던 경로로 자동으로 이동하기 위한 작업을 해줌.
	 */
	// 컨트롤러 진입해 요청 처리 후 뷰로 이동하기 전에 호출됨.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// 세션 얻어옴
		HttpSession session = request.getSession();
		UserVO vo = (UserVO) session.getAttribute("loginSession");
		
		if ( vo != null ){ // 성공적으로 로그인이 된 경우
			logger.info("새로 로그인 성공");
			// 본래 이동하려했던 경로를 AuthInterceptor에서 저장해논 세션 정보를 통해 가져옴
			Object destination = session.getAttribute("destination");

			//response.sendRedirect(destination != null ? (String)destination : "/");
			
		}
	} // end of postHandle()
	

}
