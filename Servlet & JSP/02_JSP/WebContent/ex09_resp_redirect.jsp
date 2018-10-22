<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리다이렉트 처리</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>

	<h2>ex09_resp_redirect.jsp</h2>
	ID : <%=id %><br>
	PW : <%=pwd %>

<%
	//response.sendRedirect("https://www.naver.com");
	response.sendRedirect("ex09_resp_redirect-2.jsp");
%>
</body>
</html>