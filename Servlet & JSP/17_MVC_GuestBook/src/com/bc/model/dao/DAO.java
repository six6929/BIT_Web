package com.bc.model.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.GuestbookVO;
import com.bc.mybatis.DBService;


public class DAO {
	private static SqlSession ss;
	
	//싱글턴패턴 : 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}

	public static List<GuestbookVO> getList() {
		List<GuestbookVO> list = getSql().selectList("all");
		return list;
	}
	
	public static int getInsert(GuestbookVO vo) {
		return getSql().insert("insert", vo);
	}

	public static int getUpdate(GuestbookVO gvo) {
		return getSql().update("update", gvo);
	}

	public static int getDelete(String idx) {
		return getSql().delete("delete", idx);
	}
	
}












