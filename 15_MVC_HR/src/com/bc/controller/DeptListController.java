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
 * Servlet implementation class DeptListController
 */

@WebServlet("/deptList")
public class DeptListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전달받은 부서코드(deptno) 값으로 해당 부서에 있는 직원 조회
		String deptno = request.getParameter("dept_no");
		
		//DB에서 해당 부서에 있는 직원 조회
		List<EmployeeVO> list = DAO.getDept(deptno);
		
		//응답페이지에서 사용할 수 있도록 속성에 저장(d_list)
		request.setAttribute("d_list", list);
		
		//응답페이지(dept.jsp) 지정하고 페이지 전환
		request.getRequestDispatcher("deptList.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
