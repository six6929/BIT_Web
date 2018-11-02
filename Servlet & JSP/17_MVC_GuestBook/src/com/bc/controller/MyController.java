package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.command.Command;
import com.bc.model.command.DeleteCommand;
import com.bc.model.command.DeleteOKCommand;
import com.bc.model.command.ListCommand;
import com.bc.model.command.OneListCommand;
import com.bc.model.command.UpdateCommand;
import com.bc.model.command.UpdateOKCommand;
import com.bc.model.command.WriteCommand;
import com.bc.model.command.WriteOKCommand;

/**
 * Servlet implementation class MyController
 */
@WebServlet("/MyCon")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		
		String path = null;
		Command comm = null;
		
		if(type.equals("list")) {
			comm = new ListCommand();
		} else if (type.equals("write")) {
			comm = new WriteCommand();
		} else if (type.equals("write_ok")) {
			comm = new WriteOKCommand();
		} else if (type.equals("update")) {
			comm = new UpdateCommand();
		} else if (type.equals("update_ok")) {
			comm = new UpdateOKCommand();
		} else if (type.equals("delete")) {
			comm = new DeleteCommand();
		} else if (type.equals("delete_ok")) {
			comm = new DeleteOKCommand();
		} else {
			comm = new OneListCommand();
		}
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
