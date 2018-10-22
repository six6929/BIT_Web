package com.mystudy.pm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//(실습)전달받은 이름, 국어, 영어, 수학 점수를 받아서 성적처리
		//1. 한글처리를 위한 문자셋 설정
		response.setContentType("text/html; charset=UTF-8");
		//2. 파라미터 값 추출
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		
		//3. 총점, 평균 값 구하기
		
		int tot = kor + eng + math;
		double avg = (double) ((tot * 100) / 3 / 100.0);
		
		//4. response 객체 이용 응답처리(HTML 태그 작성)
		PrintWriter out = response.getWriter();
		
		out.write("<h2>성적처리 결과 </h2>");
		out.write("<p> 이름 : " + name + "</p>");
		out.write("<p> 국어 : " + kor + "</p>");
		out.write("<p> 영어 : " + eng + "</p>");
		out.write("<p> 수학 : " + math + "</p>");
		out.write("<hr>");
		out.write("<p> 총점 : " + tot + "</p>");
		out.write("<p> 평균 : " + avg + "</p>");
		
		
		
		//--------------------------
		//응답 형식
		/*
		 성적처리 결과
		 이름 : 홍길동 -> <p> 이름 : name </p>
		 국어 : 100
		 영어 : 90
		 수학 : 80
		 ---------
		 총점 : 270
		 평균 : 90.0
		 */
		
		//---------------------------------
		//테이블 형식으로도 출력
		
		out.write("<table border='1'>");
		out.write("<tr>");
		out.write("<th> 이름 </th>");
		out.write("<th> 국어 </th>");
		out.write("<th> 영어 </th>");
		out.write("<th> 수학 </th>");
		out.write("<th> 총점 </th>");
		out.write("<th> 평균 </th>");
		out.write("</tr>");
		
		out.write("<tr>");
		out.write("<td>" + name + "</td>");
		out.write("<td>" + kor + "</td>");
		out.write("<td>" + eng + "</td>");
		out.write("<td>" + math + "</td>");
		out.write("<td>" + tot + "</td>");
		out.write("<td>" + avg + "</td>");
		out.write("</tr>");

		out.write("</table>");
		


	}

}
