package com.spring.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;
@Controller
public class UserController {
	
	@RequestMapping("/login.do") // 요청과 처리할 메소드 연결
	public String login(UserVO vo, UserDAO userDAO) {
		if (userDAO.getUser(vo) != null) {
			return "getBoardList.do";
		} else {
			return "login.jsp";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "login.jsp";
	}
}
