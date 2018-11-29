package com.spring.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;
@Controller
public class UserController {
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST) // 요청과 처리할 메소드 연결
	public String login(UserVO vo, UserDAO userDAO, HttpSession session) {
		UserVO user = userDAO.getUser(vo);
		if (user != null) {
			session.setAttribute("userName", user.getName());
			return "getBoardList.do";
		} else {
			return "login.jsp";
		}
	}
	
	//@ModelAttribute : 모델의 속성값으로 지정
	//별도 이름 지정을 안한 경우
	//public String loginView(@ModelAttribute UserVO vo) {}
	//속성명 : userVO - 타입의 첫 글자를 소문자로 변경한 이름이 사용됨
	@RequestMapping(value="/login.do", method=RequestMethod.GET) 
	public String loginView(@ModelAttribute("user") UserVO vo) {
		System.out.println(">> 로그인 화면으로 이동");
		vo.setId("test");
		vo.setPw("test");
		return "login.jsp";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "login.jsp";
	}
	
}
