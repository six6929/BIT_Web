package com.spring.biz.board;

import java.util.List;

public interface BoardService {
	//CRUD 기능 구현 메소드 정의
	//글입력
	void insertBoard(BoardVO vo);
	//글수정
	void updateBoard(BoardVO vo);
	//글삭제
	void deleteBoard(BoardVO vo);
	//글 상세 조회
	BoardVO getBoard(BoardVO vo);
	//글 목록 전체조회
	List<BoardVO> getBoardList(BoardVO vo);
}
