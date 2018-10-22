package com.mystudy.am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Ex01_Hello")
public class Ex01_Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Ex01_Hello() {
    	//WAS(어플리케이션서버/컨테이너)
    	//생성자는 서블릿이 WAS에 등록될 때 한 번만 실행
    	//한번 로딩한 후에는 재실행되지 않음
    	//URL요청에 대해서는 service() 메소드 실행
        super();
        System.out.println(">>>생성자 실행");

    }

	public void init(ServletConfig config) throws ServletException {
		//서블릿 객체가 처음 생성된 후 최초로 한 번만 실행
		//초기화 작업 등을 등록하는 용도
		System.out.println("init() 실행");
	}

	public void destroy() {
		//서버에서 내려갈 때 destory() 호출되고, 서버에서 소멸됨
		System.out.println("destroy() 실행");
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request : 요청정보(클라이언트 정보)
		//response : 응답정보(요청에 따른 결과를 전달할 정보)
		System.out.println("service() 실행");
		
		//요청정보를 확인해서 요청이 get, post 여부에 따라 분기처리
		if(request.getMethod().equalsIgnoreCase("get")) {
			doGet(request, response);
		} else if (request.getMethod().equalsIgnoreCase("post")) {
			doPost(request, response);
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(">> doGet() 실행");
		
		PrintWriter out = response.getWriter();
		out.println("<h1>Hello World!!!</h1>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		System.out.println(">> doPost() 실행");
	}

}
