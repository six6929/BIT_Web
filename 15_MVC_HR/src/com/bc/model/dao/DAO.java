package com.bc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
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

	//전체 데이터 조회해서 List에 담기
	public static List<EmployeeVO> getList() {
		List<EmployeeVO> list = getSql().selectList("list");
		return list;
	}

	public static List<EmployeeVO> getDept(String deptno) {
		return getSql().selectList("deptList", deptno);
	}

	public static List<EmployeeVO> getFullname(String fullname) {
		return getSql().selectList("fullnameList", fullname);
	}

	public static List<EmployeeVO> getSearch(String idx, String keyword) {
		Map<String, String> map = new HashMap<>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		List<EmployeeVO> list = getSql().selectList("search", map);
		return list;
	}

	
	
}












