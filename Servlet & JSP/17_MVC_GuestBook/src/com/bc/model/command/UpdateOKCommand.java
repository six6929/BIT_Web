package com.bc.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.GuestbookVO;

public class UpdateOKCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		GuestbookVO gvo = new GuestbookVO();
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		String subject = request.getParameter("subject");
		gvo.setIdx(request.getParameter("idx"));
		gvo.setName(name);
		gvo.setContent(content);
		gvo.setEmail(email);
		gvo.setSubject(subject);
		
		DAO.getUpdate(gvo);
		System.out.println(">> 입력 성공");
		return "index.jsp";
	}

}
