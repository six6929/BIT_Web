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

//	@RequestMapping("/getBoard.do")
//	public ModelAndView getBoard(BoardVO vo, 
//			BoardDAO boardDAO, ModelAndView mav) {
//		System.out.println(">>> 글 상세 조회 요청 처리(getBoard)");
//		mav.addObject("board", boardDAO.getBoard(vo));
//		mav.setViewName("getBoard.jsp");
//		
//		return mav;
//	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, 
			BoardDAO boardDAO, Model model) {
		System.out.println(">>> 글 상세 조회 요청 처리(getBoard)");
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		//model.addAttribute(attributeName, attributeValue)
		model.addAttribute("board", boardDAO.getBoard(vo));
		
		return "getBoard.jsp";
	}	
	
//	@RequestMapping("/getBoardList.do")
//	public ModelAndView getBoardList(BoardVO vo,
//			BoardDAO boardDAO, ModelAndView mav) {
//		System.out.println(">> 글목록 조회 처리(getBoardList)");
//		
//		List<BoardVO> boardList = boardDAO.getBoardList(vo);
//		
//		//ModelAndView 형식으로 리턴
//		mav.addObject("boardList", boardList);
//		mav.setViewName("getBoardList.jsp");
//		
//		return mav;
//	}	
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo,
			BoardDAO boardDAO, Model model) {
		System.out.println(">> 글목록 조회 처리(getBoardList)");
		System.out.println("codition: " + vo.getSearchCondition()
				+ ", keyword: " + vo.getSearchKeyword());
		
		//searchCondition 값 null 체크 - null값에 대한 초기화
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		List<BoardVO> boardList = boardDAO.getBoardList(vo);
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		model.addAttribute("boardList", boardList);
		
		return "getBoardList.jsp";
	}	
	
	//@RequestMapping(value="/insertBoard.do")
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 글 등록 요청 처리(insertBoard)");
		
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		boardDAO.insertBoard(vo);
		
		return "getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 글 수정 요청 처리(updateBoard)");
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		boardDAO.updateBoard(vo);
		return "getBoardList.do";
	}	
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, BoardDAO boardDAO) {
		System.out.println(">>> 글 삭제 요청 처리(deleteBoard)");
		boardDAO.deleteBoard(vo);
		return "getBoardList.do";
	}	
	
}
