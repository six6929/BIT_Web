<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션을 초기화 --%>
<%
	//세션 초기화
	session.invalidate();

	response.sendRedirect("ex01_session.jsp");
%>