package com.bc.model.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//DB연결하고 전체 데이타 가져와서 응답 페이지에 전달
		List<EmployeeVO> list = DAO.getList();

		//request 영역에 속성 설정(list라는 이름으로)
		//응답페이지에서 사용할 수 있도록
		request.setAttribute("list", list);
		
		return "list.jsp";
	}
}
