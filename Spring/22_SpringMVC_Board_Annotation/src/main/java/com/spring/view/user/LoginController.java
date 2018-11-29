package com.spring.view.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;

@Controller //객체생성 + 컨트롤러타입 + DispatcherServlet 인식하는
public class LoginController {
	
	@RequestMapping("/login.do") //요청과 처리할 메소드 연결
	public String login(UserVO vo, UserDAO userDAO) {
		//UserVO, UserDAO : command 객체
		//command 객체 : 스프링에서 객체생성해서 주입해주는 객체
		//파라미터명과 일치하는 setter가 있으면 파라미터 값 주입
		//vo : id, password 값이 주입된 상태의 객체(인스턴스)
		System.out.println(">> 로그인 처리(UserVO,UserDAO)");
		System.out.println(vo);
		//UserVO user = userDAO.getUser(vo);
		System.out.println(userDAO.getUser(vo));
		//화면 네비게이션 
		//if (user != null) {
		if (userDAO.getUser(vo) != null) {
			return "getBoardList.do";
		} else {
			return "login.jsp";
		}
		
	}

	//@RequestMapping("/login.do")
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println(">> 로그인 처리(request,response)");
		
		//1. 사용자가 입력한 데이타(정보) 추출
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		//2. DB연동처리(id,password 유무 확인)
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setPw(password);
		
		UserDAO userDAO = new UserDAO();
		UserVO user = userDAO.getUser(vo);
		
		//3. 화면 네비게이션(화면이동)
		ModelAndView mav = new ModelAndView();
		if (user != null) { //사용자가 존재하는 경우
			mav.setViewName("getBoardList.do");
		} else { //사용자가 없는 경우
			mav.setViewName("login.jsp");
		}
		return mav;
	}

}
