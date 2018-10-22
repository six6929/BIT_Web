<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식(Expression)</title>
</head>
<body>
	<h2>표현식(Expression)</h2>
	<p>HTML문을 사용해서 클라이언트에게 전달</p>
	<hr>
	<p>
	<%
	out.print("out.print문을 사용해서 클라이언트에게 전달");
	%>
	</p>
	<hr>
	
	<p><%="표현식(Expression) 사용해서 클라이언트에게 전달" %></p>
	<hr>
	<p>int 변수 2개(num1, num2)의 값을 표현식을 사용해서 합계(sum) 출력</p>
	<p>출력형태 : 200 + 100 = 300 (num1 + num2 = sum)</p>

	<%
	int num1 = 200;
	int num2 = 100;
	int sum = 0;
	sum = num1 + num2;
	%>
	
	<p> 계산 후 출력(out.print) </p>
	<%
	out.print(num2 + "+" + num1 + "=" + sum);
	%>
	
	<hr>
	<p>계산 후 출력(표현식)</p>
	<%=num1 %> + <%=num2 %> = <%=sum %>
	<br>
	<%=num2 + "+" + num1 + "=" + sum %>
</body>
</html>