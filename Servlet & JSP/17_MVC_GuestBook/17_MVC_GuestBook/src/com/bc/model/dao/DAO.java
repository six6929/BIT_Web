package com.bc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.GuestbookVO;
import com.bc.mybatis.DBService;

public class DAO {
	private static SqlSession ss;
	
	//싱글턴패턴 : 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession();
		}
		return ss;
	}

	public static List<GuestbookVO> getList() {
		List<GuestbookVO> list = getSql().selectList("all");
		return list;
	}
	public static GuestbookVO selectOne(String idx) {
		GuestbookVO vo = getSql().selectOne("one", idx);
		return vo;
	}

	public static int insert(GuestbookVO vo) {
		int result = getSql().insert("insert", vo);
		//auto commit상태가 아니므로 명시적 commit처리 필요
		getSql().commit(); 
		return result;
	}
	
	public static int update(GuestbookVO vo) {
		int result = getSql().update("update", vo);
		//auto commit상태가 아니므로 명시적 commit처리 필요
		getSql().commit(); 
		return result;
	}
	
	public static int delete(String idx) {
		int result = getSql().delete("delete", idx);
		//auto commit상태가 아니므로 명시적 commit처리 필요
		getSql().commit(); 
		return result;
	}
}












