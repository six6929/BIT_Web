<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 02_scriptlet.jsp --%>
<%
	int localNum = 0; //메소드에 선언된 변수
	
	globalNum++;
	localNum++;
	
	out.println("<h2>globalNum : " + globalNum +  "</h2>");
	out.println("<h2>localNum : " + localNum +  "</h2>");
	
%>
