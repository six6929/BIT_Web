<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터 값 추출
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호출페이지 #1</title>
<script>
	function go() {
		location.href = "ex02_second.jsp"; //파라미터 전달 안함
	}
	
	function go2(name, age) {
		location.href = "ex02_second.jsp?name=" + name + "&age=" + age; 
	}
</script>
</head>
<body>
	<h1>호출페이지 #1</h1>
	전달받은 파라미터 값<br>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	
	<hr>
	<h2>파라미터 전달 못하는 경우(리다이렉트)</h2>
<%
	//리다이렉트 방식으로 페이지 전환
	//response.sendRedirect("ex02_second.jsp"); //파라미터 전달 안됨
%>
	<hr>
	<h2>파라미터 전달 안하는 경우</h2>
	<p>a태그, 버튼클릭(location.href)</p>
	<p><a href="ex02_second.jsp">ex02_second.jsp 이동</a>
	<p><button onclick="go()">ex02_second.jsp 이동</button></p>
	
	<hr><hr>
	<h2>파라미터 전달하는 경우</h2>
	<p>a태그, 버튼클릭(location.href)</p>
	<p><a href="ex02_second.jsp?name=<%=name %>&age=<%=age %>">ex02_second.jsp 이동</a>
	<p><button onclick="go2('<%=name %>', '<%=age %>')">ex02_second.jsp 이동</button></p>
	
	<hr>
	<h2>파리미터 전달 페이지전환(forward)</h2>
<%-- 
<%
	request.getRequestDispatcher("ex02_second.jsp").forward(request, response);
%>
--%>
	<hr>
	<h2>파라미터 전달 forward(액션태그)</h2>
	<jsp:forward page="ex02_second.jsp">
		<jsp:param value='<%=name + "::forward\"%>' name="name" />
		<jsp:param value="<%=age %>" name="age" />
	</jsp:forward>
	<br><br><br><br><br><br><br><br><br>
</body>
</html>












