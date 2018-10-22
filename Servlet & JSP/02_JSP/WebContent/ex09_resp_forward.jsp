<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워딩 방식 처리</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
	<h2>ex09_resp_forward.jsp</h2>
	ID : <%=id %><br>
	PW : <%=pwd %>
<%
	request.getRequestDispatcher("ex09_resp_forward-2.jsp").forward(request, response);
%>
	
</body>
</html>