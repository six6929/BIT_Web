package com.mystudy.pm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test03")
public class Ex03 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//응답시 한글처리를 위한 문자셋 지정
		response.setContentType("text/html; charset=UTF-8");
		
		//파라미터 값 : 요청 시 해당 페이지를 불러올 때 같이 넘어오는 값
		//파라미터 형식 : ?키=값&키=값
		// 작성예) .../test03?name=hong&age=27
		
		//응답 
		//이름 : hong
		//나이 : 27
		//---------------------------
		//파라미터 값을 받는 메소드들
		//1. getParameter() : 하나의 파라미터 값을 받을 때
		//2. getParameterValues() : 체크박스처럼 배열형태 값을 받을 때
		//3. getParameterMap() : 맵 형식으로 파라미터 값을 받을 때
		//4. getParameterNames() : 파라미터 명 확인시 사용
		
		//전달받은 파라미터 값 추출(name, age - 없으면 null)
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		System.out.println("name : " + name + ", age : " + age);
		
		//응답처리
		PrintWriter out = response.getWriter();
		
		out.write("<h1>전달받은 데이터(이름, 나이)</h1>");
		out.write("<h2> 이름(name) : " + name + "</h2>");
		out.write("<h2> 나이(age) : " + age + "</h2>");
		out.close();
		
		

	}
	
	
}
