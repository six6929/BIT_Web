package com.bc.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.GuestbookVO;

public class DeleteOKCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		System.out.println("idx : "+idx);
		DAO.getDelete(idx);
		System.out.println(">> 삭제 성공");
		return "index.jsp";
	}

}
