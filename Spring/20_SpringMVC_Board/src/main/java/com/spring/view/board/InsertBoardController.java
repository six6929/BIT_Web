package com.spring.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

public class InsertBoardController implements Controller {

	@Override
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
