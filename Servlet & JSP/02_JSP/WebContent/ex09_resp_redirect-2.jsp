<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex09_resp_redirect-2.jsp</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>

	<h2>ex09_resp_redirect-2.jsp</h2>
	ID : <%=id %><br>
	PW : <%=pwd %>
</body>
</html>