package com.spring.biz.board;

import java.util.List;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class BoardServiceClient {
	public static void main(String[] args) {
		//1. 스프링컨테이너 가동
		AbstractApplicationContext container 
		 = new GenericXmlApplicationContext("applicationContext.xml");
		
		//2. 필요한 객체 사용
		//Board 테이블에 데이터 입력,수정,삭제,조회
		BoardService boardService =
				(BoardService) container.getBean("boardService");
		
		//2-1. 입력
		BoardVO vo = new BoardVO();
		vo.setTitle("테스트2");
		vo.setWriter("홍길동");
		vo.setContent("테스트2 내용");
		boardService.insertBoard(vo);
		
		
		//2-2. 수정
		/*vo.setSeq(2);
		vo.setTitle("테스트2-수정");
		vo.setContent("테스트2 내용");
		boardService.updateBoard(vo);*/
		
		
/*		//2-3. 삭제
		vo.setSeq(3);
		boardService.deleteBoard(vo);*/
		
		//2-4. 글 목록 조회
		List<BoardVO> boardList = boardService.getBoardList(vo);
		for (BoardVO board : boardList) {
			System.out.println(board.toString());
		}
		//3. 컨테이너 종료(close)
		container.close();
	}
}
