package com.bc.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ShopDAO {
	private static SqlSession ss;
	private List<ShopVO> list;
	
	public ShopDAO() {
		ss = DBService.getFactory().openSession();
	}
	
	public List<ShopVO> list(String category) {
		list = ss.selectList("list", category);
		return list;
	}
	
	public ShopVO selectOne(String p_num) {
		ShopVO vo = ss.selectOne("one", p_num);
		return vo;
	}
}








