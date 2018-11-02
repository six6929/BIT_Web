package com.bc.model.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;

public class FullnameListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String fullname = request.getParameter("fullname");

		//DB에서 이름검색
		List<EmployeeVO> list = DAO.getFullname(fullname);
		
		//응답페이지에서 사용할 수 있도록 속성에 저장(list)
		request.setAttribute("list", list);
		
		return "fullnameList.jsp";
	}

}
