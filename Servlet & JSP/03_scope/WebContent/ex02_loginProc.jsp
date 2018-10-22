<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 아이디, 암호를 사용해서 로그인 처리 -->
<%
	//전달 받을 파라미터 값 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//아이디, 암호를 확인해서 로그인 처리
	//DB에 있는 데이터를 확인해서 처리해야하나 약식 처리
	//loginResult : true이면 로그인 성공
	//loginResult : false이면 로그인 실패
	boolean loginResult = false;
	
	if(id.equals("hong") && pwd.equals("1234")) {
		loginResult = true;
	}
	
	//로그인 성공시 session의 login_chk = "ok", 실패시 ="fail"
	if(loginResult == true) {
		session.setAttribute("login_chk", "ok");
		session.setAttribute("id", id);
		session.setAttribute("pwd", id);
	} else {
		session.setAttribute("login_chk", "fail");		
	}
	
	//로그인 페이지로 이동
	response.sendRedirect("ex02_login.jsp");
%>