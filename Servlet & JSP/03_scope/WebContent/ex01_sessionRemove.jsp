<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--세션에 설정된 속성 삭제 --%>
<%
	//속성을 삭제(age)
	session.removeAttribute("attr_age"); //속성 자체를 삭제

	//session.setAttribute("attr_age", ""); //속성값 초기화
	
	//ex01_session.jsp 재호출
	response.sendRedirect("ex01_session.jsp");
%>