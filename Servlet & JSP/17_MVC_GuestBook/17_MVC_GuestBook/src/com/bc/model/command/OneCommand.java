package com.bc.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.GuestbookVO;

public class OneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//전달받은 idx값 추출
		String idx = request.getParameter("idx");
		
		//데이타베이스 연결 및 데이타 가져오기
		
		//2. SqlSession 객체 사용해서 SQL문장 실행(idx 전달)
		GuestbookVO vo = DAO.selectOne(idx);
		
		//session 영역에 guestbookVO 속성명으로 vo 저장
		//HttpSession session = request.getSession();
		//session.setAttribute("guestbookVO", vo);
		
		request.getSession().setAttribute("guestbookVO", vo);
		
		return "onelist.jsp";
	}

}





