package com.bc.model.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		System.out.println("idx:"+ idx + ", keyword:"+ keyword );
		
		String path = "";
		//단순 페이지 전환인지, DB데이타 조회처리를 해야하는 지 결정
		//응답처리할 페이지가 search.jsp인지 searchList.jsp인지 결정
		if (keyword == null || keyword.equals("")) {
			//keyword 파라미터가 없을 때(index.jsp -> search.jsp)
//			request.getRequestDispatcher("search.jsp")
//					.forward(request, response);
			path = "search.jsp";
		} else {
			//검색할 값을 전달 받은 경우
			//DB에서 검색조건(idx, keyword)으로 데이타 조회
			List<EmployeeVO> list = DAO.getSearch(idx, keyword);
			
			String title = "";
			switch (idx) {
				case "0" : title = "사번"; break;
				case "1" : title = "이름"; break;
				case "2" : title = "직종"; break;
				case "3" : title = "부서"; break;
			}
			//조회된 데이타를 searchList.jsp에서 사용할 수 있도록 속성저장
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			
			//페이지이동(searchList.jsp 페이지 위임 forward)
//			request.getRequestDispatcher("searchList.jsp")
//					.forward(request, response);
			path = "searchList.jsp";
		}
		
		
		
		return path;
	}

}
