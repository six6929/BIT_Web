package com.spring.view.board;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;

@Controller
public class BoardController {
	/*
	 * // List
	 * 
	 * @RequestMapping("/getBoardList.do") public ModelAndView getBoardList(BoardVO
	 * vo, BoardDAO boardDAO, ModelAndView mav) {
	 * 
	 * List<BoardVO> boardList = boardDAO.getBoardList(vo);
	 * 
	 * // ModelAndView 형식으로 리턴 mav.addObject("boardList", boardList);
	 * mav.setViewName("getBoardList.jsp"); return mav; }
	 */

	// List
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, BoardDAO boardDAO, Model model) {

		//Model 형식으로 저장해서 DispatcherServlet에 전달
		model.addAttribute("boardList", boardDAO.getBoardList(vo));

		return "getBoardList.jsp";
	}

	/*
	 * // 글 상세보기
	 * 
	 * @RequestMapping("/getBoard.do") public String getBoard(BoardVO vo, BoardDAO
	 * boardDAO, HttpSession session) { BoardVO board = boardDAO.getBoard(vo);
	 * 
	 * session.setAttribute("board", board); return "getBoard.jsp"; }
	 */

	// 글 상세보기
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, BoardDAO boardDAO, Model model) {
		// model.addAttribute(attributeName, attributeValue);
		model.addAttribute("board", boardDAO.getBoard(vo));
		return "getBoard.jsp";
	}

	// 게시물 삭제
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.deleteBoard(vo);

		return "getBoardList.do";
	}

	// 게시물 입력
	@RequestMapping("insertBoard.do")
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.insertBoard(vo);

		return "getBoardList.do";
	}

	// 게시물 수정
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo, BoardDAO boardDAO) {
		boardDAO.updateBoard(vo);

		return "getBoardList.do";
	}
}
