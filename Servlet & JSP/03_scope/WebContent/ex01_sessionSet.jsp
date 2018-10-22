<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션 데이터 저장하기 --%>
<%
	//속성명, 속성값
	session.setAttribute("attr_name", "홍길동");
	session.setAttribute("attr_age", "27");
	
	response.sendRedirect("ex01_session.jsp");
%>