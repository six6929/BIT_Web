package com.spring.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

public class LoginController implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(">> 로그인 처리");
		// System.out.println(">>> 로그인 처리 요청");
		// 1. 사용자가 입력한 데이터(정보) 추출
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		// 2. DB연동처리(id, password 유무확인)
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPw(password);

		UserDAO userDAO = new UserDAO();
		UserVO user = userDAO.getUser(vo);

		// 3. 화면 네비게이션(화면이동)
		ModelAndView mav = new ModelAndView();
		if (user != null) { // 사용자가 존재하는 경우
			mav.setViewName("redirect:getBoardList.do");;
		} else { // 사용자가 없는 경우
			//return "login.jsp";
			mav.setViewName("redirect:login");
		}
		return mav;
	}


	/*@Override
	public String handlerRequest(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(">> 로그인 처리");
		// System.out.println(">>> 로그인 처리 요청");
		// 1. 사용자가 입력한 데이터(정보) 추출
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		// 2. DB연동처리(id, password 유무확인)
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPw(password);

		UserDAO userDAO = new UserDAO();
		UserVO user = userDAO.getUser(vo);

		// 3. 화면 네비게이션(화면이동)
		if (user != null) { // 사용자가 존재하는 경우
			return "getBoardList.do";
		} else { // 사용자가 없는 경우
			//return "login.jsp";
			return "login";
		}
	}
*/
}
