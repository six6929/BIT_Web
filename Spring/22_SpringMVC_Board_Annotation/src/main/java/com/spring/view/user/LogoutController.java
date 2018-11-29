package com.spring.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session ) {
		System.out.println(">> 로그아웃 요청 처리(logout)");
		session.invalidate();
		
		return "login.jsp";
	}
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 브라우저와 연결된 세션 객체들 종료(초기화)
		HttpSession session = request.getSession();
		session.invalidate();

		// 2. 화면 네비게이션(로그인 페이지)
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login.jsp");
		return mav;
	}

	/*
	 * @Override public String handlerRequest(HttpServletRequest request,
	 * HttpServletResponse response) { //1. 브라우저와 연결된 세션 객체들 종료(초기화) HttpSession
	 * session = request.getSession(); session.invalidate();
	 * 
	 * //2. 화면 네비게이션(로그인 페이지) return "login.jsp"; }
	 */

}
