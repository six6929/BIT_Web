<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부(declaration)</title>
</head>
<body>
	<h2>1~10까지의 합 구하기</h2>
	<%--스크립트릿(서블릿 service 메소드 영역 코드) --%>
	<%
	int sum = 0; // 지역변수(service 메소드 내에 있는)
	for(int i=1; i<=10; i++) {
		sum += i;
	}
	out.println("1+2+3+...+10= "); //브라우저 화면상에 출력
	%>
	<%=sum %> <%-- 표현식 : out.print 대체 --%>
	<%-- 선언부(declaration) : 필드변수, 메소드 선언 --%>
	<%!
	int tot = 0; //전역변수
	public int add(int a, int b) {
		return a + b;
	}
	%>
	<h2>덧셈</h2>
	<p>
		100 + 200 = <%=add(100, 200) %> 
	</p>
	<%
		tot = add(100,200);
	%>
	<p>
		100 + 200 = <%=tot %>
	</p>
</body>
</html>