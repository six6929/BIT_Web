<%@page import="com.spring.biz.user.impl.UserDAO"%>
<%@page import="com.spring.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- id, password 값을 받아서 DB에 있는지 확인 후 로그인 처리 --%>
<%
	//1. 사용자가 입력한 데이터(정보) 추출
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//2. DB연동처리(id, password 유무확인)
	UserVO vo = new UserVO();
	vo.setId(id);
	vo.setPw(password);
	
	UserDAO userDAO = new UserDAO();
	UserVO user = userDAO.getUser(vo);
	
	//3. 화면 네비게이션(화면이동)
	if(user != null) { //사용자가 존재하는 경우
		//System.out.println(vo.getId() + "님 환영합니다");
		response.sendRedirect("getBoardList.jsp");
	} else { //사용자가 없는 경우
		//System.out.println("회원정보가 없습니다.");
		response.sendRedirect("login.jsp");
	}
%>