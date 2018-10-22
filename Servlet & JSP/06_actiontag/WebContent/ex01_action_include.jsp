<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 : include</title>
</head>
<body>
<%--
	JSP액션 : JSP 페이지 사이의 흐름제어, 자바빈즈 컴포넌트와 상호지원
	사용형태 : <jsp : 액션명령></액션명령>
 --%>
	<h1>액션태그 : include</h1>
	<hr>
	<h2>디렉티브(지시어) : include</h2>
	<%@ include file="ex01_includee1.jsp" %>
	
	<hr>
	<!-- 디렉티브의 include는 파라미터 값을 전달하지 못함 -->
	<%@ include file="ex01_includee2_param.jsp"%>
	<!-- ====================================== -->
	<hr>
	<hr>
	<%-- 액션태그 include 대상파일은 jspf 사용하지 말 것 --%>
	<h2>JSP액션 include(동적) : include1</h2>
	<jsp:include page="ex01_includee1.jsp"></jsp:include>
	
	
	<hr>
	<%--JSP액션태그 include는 파라미터 전달 가능 --%>
	<jsp:include page="ex01_includee2_param.jsp">
		<jsp:param name="name" value="홍길동" />
		<jsp:param name="age" value="27" />
	</jsp:include>
	
</body>
</html>