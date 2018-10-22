package com.mystudy.am;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex02
 */
@WebServlet("/today")
public class Ex02 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//오늘 날짜를 표시(년월일)
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1; //MONTH : 0~11까지
		int day = cal.get(Calendar.DAY_OF_MONTH);
		
		//한글 깨짐 방지를 위한 문자타입 처리(UTF-8)
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset = 'utf=8'");
		out.println("<title>처음 만든 서블릿 예제</title>");	
		out.println("</head>");
		
		out.println("<body>");
		out.println("<h1>오늘 날짜는?</h1>");
		out.println("<p>오늘 날짜는 : " + year + "년" + month + "월" + day + "일" + "</p>");
		out.println("</body>");
		out.println("</html>");

		out.close();
		
		
	}

}
