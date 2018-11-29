package com.spring.view.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class UpdateBoardController  {
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.updateBoard(vo);
		
		return "getBoardList.do";
	}
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1.파라미터값 받아오기
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String seq = request.getParameter("seq");

		// 2.DB연결
		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);
		vo.setSeq(Integer.parseInt(seq));

		BoardDAO boardDAO = new BoardDAO();
		boardDAO.updateBoard(vo);

		// 3.화면으로 이동
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getBoardList.do");
		return mav;
	}
	/*
	 * @Override public String handlerRequest(HttpServletRequest request,
	 * HttpServletResponse response) { //1.파라미터값 받아오기 String title =
	 * request.getParameter("title"); String writer =
	 * request.getParameter("writer"); String content =
	 * request.getParameter("content"); String seq = request.getParameter("seq");
	 * 
	 * //2.DB연결 BoardVO vo = new BoardVO(); vo.setTitle(title);
	 * vo.setWriter(writer); vo.setContent(content);
	 * vo.setSeq(Integer.parseInt(seq));
	 * 
	 * BoardDAO boardDAO = new BoardDAO(); boardDAO.updateBoard(vo);
	 * 
	 * //3.화면으로 이동 return "getBoardList.do"; }
	 */

}
