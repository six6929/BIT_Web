package com.bc.mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	private static SqlSession ss;
	
	//싱글턴패턴 : 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	//표시할 게시글 조회
	public static List<BBSVO> getList(Map<String, Integer> map) {
//		List<BBSVO> list = getSql().selectList("list");
//		getSql().commit(); //openSession() 처리한 경우 명시적 commit 필요
//		return list;
		return getSql().selectList("list", map);
	}
	
	//게시글 상세보기 데이타 조회
	public static BBSVO selectOne(String b_idx) {
		return getSql().selectOne("one", b_idx);
	}
	
	//게시물(BBS_T)의 전체 건수 조회
	public static int getTotalCount() {
		int totalCount = getSql().selectOne("totalCount");
		return totalCount;
	}
	
	//데이타 입력 처리
	public static int insert(BBSVO bvo) {
		return getSql().insert("insert", bvo);
	}
	
	//게시글 수정 처리
	public static int update(BBSVO bvo) {
		return getSql().update("update", bvo);
	}
	
	//게시글 삭제 처리
	public static int delete(String b_idx) {
		return getSql().delete("delete", b_idx);
	}
	
	//조회수 수정 처리(1 증가)
	public static int updateHit(BBSVO bvo) {
		return getSql().update("hitVO", bvo);
	}
	
	//조회수 증가 처리(1 증가)
	public static int updateHit(int b_idx) {
		return getSql().update("hit", b_idx);
	}
	
	//---------------------------------------------
	//게시글에 딸린 댓글 조회
	public static List<CommVO> getCommList(String b_idx) {
		return getSql().selectList("commList", b_idx);
	}
	
	//댓글 입력
	public static int insertComment(CommVO cvo) {
		return getSql().insert("c_insert", cvo);
	}
	
	//댓글 삭제
	public static int deleteComment(String c_idx) {
		return getSql().delete("c_delete", c_idx);
	}
}












