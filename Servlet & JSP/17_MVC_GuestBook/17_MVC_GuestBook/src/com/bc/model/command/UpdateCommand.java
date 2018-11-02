package com.bc.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.GuestbookVO;

public class UpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("update_chk");
		String idx = request.getParameter("idx");
		
		String path = null;
		if (chk == null) {
			path = "update.jsp";
		} else {
			//전달받은 값을 DB에 수정처리
			GuestbookVO vo = new GuestbookVO();
			vo.setIdx(idx);
			vo.setName(request.getParameter("name"));
			vo.setSubject(request.getParameter("subject"));
			vo.setEmail(request.getParameter("email"));
			vo.setContent(request.getParameter("content"));
			vo.setPwd(request.getParameter("pwd"));
			
			DAO.update(vo);
			
			path = "MyCon?type=one&idx=" + idx;
		}
		
		return path;
	}

}
