package com.spring.view.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.biz.user.UserVO;
import com.spring.biz.user.impl.UserDAO;
import com.spring.view.board.GetBoardListController;
import com.spring.view.user.LoginController;


public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HandlerMapping hadlerMapping;
	private ViewResolver viewResolver;


	public void init(ServletConfig config) throws ServletException {
		super.init();
		hadlerMapping = new HandlerMapping();
		viewResolver = new ViewResolver();
		viewResolver.setPrefix("./"); //파일의 위치경로(현재위치)
		viewResolver.setSuffix(".jsp"); //파일의 타입(속성)
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) 
			throws IOException {
		System.out.println(">>> *.do 에 대한 요청 처리");
		
		//1. 클라이언트의 요청 path 정보 추출
		String uri = request.getRequestURI();
		System.out.println("uri: " + uri); //uri : /BoardWeb/login.do
		
		String path = uri.substring(uri.lastIndexOf("/"));
		System.out.println("path: " + path);
		
		//2. 클라이언트의 요청 path에 대한 처리
/*		
		if (path.equals("/login.do")) {
			//System.out.println(">>> 로그인 처리 요청");
			
			//1. 요청처리할 컨트롤러 객체 생성
			//LoginController ctrl = new LoginController();
			//Controller ctrl = new LoginController();
			Controller ctrl = hadlerMapping.getController(path);
			
			//2. 컨트롤러의 handleRequest 메소드 호출해서 처리
			String viewName = ctrl.handleRequest(request, response);
			
			//3. 화면네비게이션 처리
			response.sendRedirect(viewName);
		} else if (path.equals("/getBoardList.do")) {
			System.out.println(">>> 글 목록 조회 요청 처리");
			
			//1. 요청처리할 컨트롤러 객체 생성
			//GetBoardListController ctrl = new GetBoardListController();
			//Controller ctrl = new GetBoardListController();
			Controller ctrl = hadlerMapping.getController(path);
			
			//2. 컨트롤러의 handleRequest 메소드 호출해서 처리
			String viewName = ctrl.handleRequest(request, response);
			
			//3. 화면네비게이션 처리
			response.sendRedirect(viewName);
		}  
*/		
		//1. 요청처리할 컨트롤러 객체 생성
		Controller ctrl = hadlerMapping.getController(path);
		
		//2. 컨트롤러의 handleRequest 메소드 호출해서 처리
		String viewName = ctrl.handlerRequest(request, response);
		
		//ViewResolver를 사용해서 응답할 페이지 정보 만들기
		String view = null;
		if(viewName.contains(".do")) {
			view = viewName;
		} else { //뷰(View) 이름만 전달받은 경우
			view = viewResolver.getView(viewName);
		}
		System.out.println("view 이름 : " + view);
		//3. 화면네비게이션 처리
		response.sendRedirect(view);
	}

}
