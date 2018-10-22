<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	String[] hobby = request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>
</head>
<body>
	<h1>회원가입 정보</h1>
	<ul>
		<li>이름 : <%=name %></li>
		<li>아이디 : <%=id %></li>
		<li>비밀번호 : <%=pwd %></li>
		<li>이메일 : <%=email %></li>
		<li>취미 :  
		<%
		if(hobby == null) {
			out.write("선택사항없음");
		} else {
			for(String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
		%>
		</li>
	</ul>
</body>
</html>