package com.bc.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.GuestbookVO;

public class WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("write_chk");
		String path = null;
		if (chk == null) {
			path = "write.jsp";
		} else {
			//전달받은 값을 DB에 입력처리
			GuestbookVO vo = new GuestbookVO();
			vo.setName(request.getParameter("name"));
			vo.setSubject(request.getParameter("subject"));
			vo.setEmail(request.getParameter("email"));
			vo.setContent(request.getParameter("content"));
			vo.setPwd(request.getParameter("pwd"));
			DAO.insert(vo);
			
			path = "MyCon?type=list";
		}
		
		return path;
	}

}
