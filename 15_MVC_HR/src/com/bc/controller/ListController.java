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
 * Servlet implementation class ListController
 */
@WebServlet("/list")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> doGet() 시작 -----");

		process(request, response);
		
		System.out.println("----- >> doGet() 종료");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> doPost 시작 ----------");
		request.setCharacterEncoding("utf-8");
		
		process(request, response);

		System.out.println("---------- >> doPost 종료");
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("text/html; charset=uft-8");
		//System.out.println(">> 요청작업에 대한 처리");
		//DB연결하고 전체 데이터 가져와서 응답 페이지에 전달
		List<EmployeeVO> list = DAO.getList();
		
		//request 영역에 속성 설정(list라는 이름으로)
		//응답페이지에서 사용할 수 있도록
		request.setAttribute("list", list);
		
		//응답페이지(list.jsp) 지정하고 페이지 전환
		request.getRequestDispatcher("list.jsp").forward(request, response);;
	}

}
