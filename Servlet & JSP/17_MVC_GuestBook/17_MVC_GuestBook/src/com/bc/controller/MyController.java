package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.command.Command;
import com.bc.model.command.DeleteCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.command.OneCommand;
import com.bc.model.command.UpdateCommand;
import com.bc.model.command.WriteCommand;

@WebServlet("/MyCon")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		
		String path = null;
		Command comm = null;
		
		if (type.equals("list")) {
			comm = new ListCommand();
		} else if (type.equals("write")) {
			comm = new WriteCommand();
		} else if (type.equals("one")) {
			comm = new OneCommand();
		} else if (type.equals("update")) {
			comm = new UpdateCommand();
		} else if (type.equals("delete")) {
			comm = new DeleteCommand();
		}
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}
}












