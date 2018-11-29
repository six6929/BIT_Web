package com.spring.view.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class GetBoardListController {
	
	@RequestMapping("/getBoardList.do")
	public ModelAndView getBoardList(BoardVO vo, BoardDAO boardDAO, ModelAndView mav) {
		System.out.println(">> 글목록 조회 처리(getBoardList)");
		
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		
		//ModelAndView 형식으로 리턴
		mav.addObject("boardList", boardList);
		mav.setViewName("getBoardList.jsp");
		return mav;
	}
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 전달받은 값 추출
		// 2. DB연동처리
		BoardVO vo = new BoardVO();

		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> boardList = boardDAO.getBoardList(vo);

		// 3. 검색결과를 세션에 저장하고 목록화면으로 이동
/*		HttpSession session = request.getSession();
		session.setAttribute("boardList", boardList);*/

		// 3-1. 목록화면으로 이동
		// return "getBoardList.jsp";
		
		//3.ModelAndView 형식으로 작성 후 리턴
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", boardList);
		mav.setViewName("getBoardList.jsp");
		return mav;
	}

	/*
	 * @Override public String handlerRequest(HttpServletRequest request,
	 * HttpServletResponse response) { //1. 전달받은 값 추출 //2. DB연동처리 BoardVO vo = new
	 * BoardVO();
	 * 
	 * BoardDAO boardDAO = new BoardDAO(); List<BoardVO> boardList =
	 * boardDAO.getBoardList(vo);
	 * 
	 * //3. 검색결과를 세션에 저장하고 목록화면으로 이동 HttpSession session = request.getSession();
	 * session.setAttribute("boardList", boardList);
	 * 
	 * //3-1. 목록화면으로 이동 //return "getBoardList.jsp"; return "getBoardList"; }
	 */

}
