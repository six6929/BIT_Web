<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부에 선언된 변수</title>
</head>
<body>
<%!
	//선언부에 선언된 변수는 static처럼 공유되어 사용됨
	//서블릿 호출시 값이 유지된 상태로 사용됨
	int globalNum = 0;

%>

<%
	//선언부에 선언된 변수는 static처럼 공유되어 사용됨
	//서블릿 호출시 값이 유지된 상태로 사용됨
	int localNum = 0;

	globalNum++;
	localNum++;
	System.out.println("globalNum : " + globalNum);
	System.out.println("localNum : " + localNum);
%>

	<h2>globalNum : <%=globalNum %></h2>
	<h2>localNum : <%=localNum %></h2>
</body>
</html>