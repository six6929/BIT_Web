<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트릿(Scriptlet)</title>
</head>
<body>
	<h1>스크립트릿(Scriptlet)</h1>
	<p>자바코드를 작성하는 용도로 사용</p>
	<%
	int a = 100;
	int b = 2;
	System.out.println(">> 콘솔창에 출력");
	System.out.println("a + b : " + (a + b));
	%>
	
	<%
	//JSP에서 제공하는 out객체
	//서블릿 작성시 PrintWriter out = response.getWriter()
	//형태로 사용했던 out객체라고 생각하면 됨
	//out : 응답객체(response)에 출력하는 용도의 객체
	out.println("<hr>");
	out.println("<p>JSP에서 제공하는 out객체를 통한 출력</p>");
	out.println("<h2>a + b : " + (a + b) + "</h2>");
	%>
</body>
</html>