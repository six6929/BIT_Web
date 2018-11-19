package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;

/**
 * Servlet implementation class FullnameListController
 */
@WebServlet("/fullnameList")
public class FullnameListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//이름 값 받아오기
		String fullname = request.getParameter("fullname");

		//DB에서 이름검색
		List<EmployeeVO> list = DAO.getFullname(fullname);
		
		//응답페이지에서 사용할 수 있도록 속성에 저장(list)
		request.setAttribute("list", list);
		
		//응답페이지(fullname.jsp) 지정하고 페이지 전환
		request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		doGet(request, response);
	}

}
