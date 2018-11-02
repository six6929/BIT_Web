package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.command.Command;
import com.bc.model.command.DeptCommand;
import com.bc.model.command.DeptListCommand;
import com.bc.model.command.FullnameCommand;
import com.bc.model.command.FullnameListCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.command.SearchCommand;
import com.bc.model.dao.DAO;
import com.bc.model.vo.EmployeeVO;


@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		String path = "";
		Command comm = null;
		
		if (type.equals("all")) {
			comm = new ListCommand();
			
		} else if (type.equals("dept")) {
			comm = new DeptCommand();
			
		} else if (type.equals("deptList")) {
			comm = new DeptListCommand();
			
		} else if (type.equals("fullname")) {
			comm = new FullnameCommand();
			
		} else if (type.equals("fullnameList")) {
			comm = new FullnameListCommand();
			
		} else if (type.equals("search")) {
			comm = new SearchCommand();
		}
		path = comm.exec(request, response);
		request.getRequestDispatcher(path)
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
