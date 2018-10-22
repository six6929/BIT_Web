<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션 초기화 후 로그인 페이지로 이동--%>
<%
	session.invalidate();
	response.sendRedirect("ex03_login.jsp");
%>