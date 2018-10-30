<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL01_redirect.jsp</title>
</head>
<body>
	<h1>JSTL01_redirect.jsp</h1>
	<p>페이지 전환 : redirect </p>
	<c:redirect url="JSTL02.jsp">
		<c:param name="name" value="홍길동"/>
		<c:param name="age">27</c:param>
		
	</c:redirect>
</body>
</html>