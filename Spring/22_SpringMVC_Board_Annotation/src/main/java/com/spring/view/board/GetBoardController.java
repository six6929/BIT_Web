package com.spring.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class GetBoardController {
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, BoardDAO boardDAO, HttpSession session) {
		BoardVO board = boardDAO.getBoard(vo);
		
		session.setAttribute("board", board);
		return "getBoard.jsp";
	}
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 전달 받은 값 추출
		String seq = request.getParameter("seq");

		// 2. DB 연동처리(하나의 글 조회)
		BoardVO vo = new BoardVO();
		vo.setSeq(Integer.parseInt(seq));

		BoardDAO boardDAO = new BoardDAO();
		BoardVO board = boardDAO.getBoard(vo);

		// 3. 조회된 데이타 화면표시(HTML 태그 작성)

		HttpSession session = request.getSession();
		session.setAttribute("board", board);

		// 3. 조회된 데이타 화면표시(HTML 태그 작성)
		// return "getBoard.jsp"; //ViewResolver 사용 전
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", board);
		mav.setViewName("getBoard.jsp");
		return mav;
	}

	/*
	 * @Override public String handlerRequest(HttpServletRequest request,
	 * HttpServletResponse response) { //1. 전달 받은 값 추출 String seq =
	 * request.getParameter("seq");
	 * 
	 * //2. DB 연동처리(하나의 글 조회) BoardVO vo = new BoardVO();
	 * vo.setSeq(Integer.parseInt(seq));
	 * 
	 * BoardDAO boardDAO = new BoardDAO(); BoardVO board = boardDAO.getBoard(vo);
	 * 
	 * //3. 조회된 데이타 화면표시(HTML 태그 작성)
	 * 
	 * HttpSession session = request.getSession(); session.setAttribute("board",
	 * board);
	 * 
	 * //3. 조회된 데이타 화면표시(HTML 태그 작성) //return "getBoard.jsp"; //ViewResolver 사용 전
	 * return "getBoard" ;//ViewResolver 사용시 이름만 }
	 */

}
