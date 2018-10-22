package com.mystudy.pm;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Ex04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//응답시 한글처리를 위한 문자셋 설정
		response.setContentType("text/html; charset=utf-8");
		
		//request 객체의 파라미터 값을 받는 메소드들
		//1. getParameter() : 하나의 파라미터 값을 받을 때
		//2. getParameterValues() : 체크박스처럼 배열형태 값을 받을 때
		//3. getParameterMap() : 맵 형식으로 파라미터 값을 받을 때
		//4. getParameterNames() : 파라미터명 확인시 사용
		
		//요청정보 추출
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//취미값 추출(체크박스)
		String[] hobby = request.getParameterValues("hobby");
		
		System.out.println("name: " + name + "\n" +
						   "id: " + id + "\n" +
						   "pwd: " + pwd + "\n" +
						   "email: " + email + "\n" +
						   "hobby: " + hobby
						   );
		
		
		//응답 정보 작성
		PrintWriter out = response.getWriter();
		out.write("<h2>회원가입정보</h2>");
		out.write("<ul>");
		out.write("<li>이름: " + name + "</li>");
		out.write("<li>아이디: " + id + "</li>");
		out.write("<li>암호: " + pwd + "</li>");
		out.write("<li>이메일: " + email + "</li>");
		out.write("<li>취미: ");
		if(hobby == null) {
			out.write("선택사항없음");
		} else {
			for (String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		out.write("</li>");
		out.write("</ul>");
		out.write("<hr>");
		
		//------------------------------------------
		//3. getParameterMap() : 맵 형식으로 파라미터 값을 받을 때
		Map<String, String[]> paramMap = request.getParameterMap();
		String[] names = paramMap.get("name");
		String[] hobby2 = paramMap.get("hobby");
		
		out.println("<h3>파라미터를 Map 형식으로 받아서 처리</h3>");
		out.println("<ol>");
		out.println("<li>이름 : " + names[0] + "</li>");
		out.println("<li>취미 : " );
		if(hobby == null) {
			out.write("선택사항없음");
		} else {
			for (String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		out.println("</li>");
		out.println("</ol>");
		out.println("<hr>");
		
		//------------------------------------------
		//4. getParameterNames() : 파라미터명 확인시 사용
		//파리미터명 추출
		out.println("<h3>넘겨받은 파라미터명</h3>");
		Enumeration<String> paramNames = request.getParameterNames();
		while(paramNames.hasMoreElements()) {
			out.println("<p>");
			out.print(paramNames.nextElement());
			out.println("</p>");
		}
		out.close();
	}

}





