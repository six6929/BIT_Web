package com.spring.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class InsertBoardController {
	
	//@RequestMapping 역할은 요청과 처리를 연결(HandlerMapping 역할)
	//BoardVO, BoardDAO : Command객체
	//Command 객체 : 스프링에서 객체생성해서 주입해주는 객체
	//BoardVO vo :전달받은 파라미터명과 일치하는 setter에 값 주입
	//스프링 프레임워크에서 Command 객체를 사용하는 형태
	//1. BoardVO 타입의 객체를 생성
	//2. BoardVO 타입의 객체에 전달받은 파라미터 값 주입(setter 사용)
	//3. BoardVO 타입의 객체를 파라미터 값으로 전달(주입)
	@RequestMapping("insertBoard.do")
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo 변수에 담기
		boardDAO.insertBoard(vo);
		
		//전달받은 파라미터값을 사용해서 입력처리
		return "getBoardList.do";
	}
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 전달 받은 데이터 추출

		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");

		// 2. DB 연동 처리(데이터 입력)
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);

		BoardDAO boardDAO = new BoardDAO();
		boardDAO.insertBoard(vo);

		// 3. 화면 네비게이션(목록페이지 이동)
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getBoardList.do");
		return mav;
	}

	/*
	 * @Override public String handlerRequest(HttpServletRequest request,
	 * HttpServletResponse response) { //1. 전달 받은 데이터 추출
	 * 
	 * String title = request.getParameter("title"); String writer =
	 * request.getParameter("writer"); String content =
	 * request.getParameter("content");
	 * 
	 * //2. DB 연동 처리(데이터 입력) BoardVO vo = new BoardVO(); vo.setTitle(title);
	 * vo.setWriter(writer); vo.setContent(content);
	 * 
	 * BoardDAO boardDAO = new BoardDAO(); boardDAO.insertBoard(vo);
	 * 
	 * //3. 화면 네비게이션(목록페이지 이동)
	 * 
	 * return "getBoardList.do"; }
	 */

}
