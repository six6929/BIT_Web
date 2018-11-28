package com.spring.view.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.spring.biz.board.BoardVO;
import com.spring.biz.board.impl.BoardDAO;
import com.spring.view.controller.Controller;

public class GetBoardListController implements Controller{

	@Override
	public String handlerRequest(HttpServletRequest request, HttpServletResponse response) {
		//1. 전달받은 값 추출
		//2. DB연동처리
		BoardVO vo = new BoardVO();

		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		
		//3. 검색결과를 세션에 저장하고 목록화면으로 이동
		HttpSession session = request.getSession();
		session.setAttribute("boardList", boardList);
		
		//3-1. 목록화면으로 이동
		//return "getBoardList.jsp";
		return "getBoardList";
	}

}
