package com.bc.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.GuestbookVO;

public class WriteOKCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		GuestbookVO vo = new GuestbookVO();
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setEmail(request.getParameter("email"));
		vo.setSubject(request.getParameter("subject"));
		vo.setName(request.getParameter("name"));
		
		int result = DAO.getInsert(vo);
		
		DAO.getInsert(vo);
		System.out.println(">> 입력 성공");
		return "index.jsp";
	}

}
