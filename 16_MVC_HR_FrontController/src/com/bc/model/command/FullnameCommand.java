package com.bc.model.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FullnameCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		return "fullname.jsp";
	}

}
