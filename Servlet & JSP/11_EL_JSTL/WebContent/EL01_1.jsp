<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(Expression Language)</title>
</head>
<body>

<%--
	표현언어 EL(Expression Language)
	1. 표현식을 대신해서 사용 : ${ }
		<%=변수 %> --> ${변수 }, ${계산식 }
	2. 변수값을 표시할 경우 반드시 scope안에 변수가 존재해야함
		scope : pageContext, request, session, application
		해당 scope 상에 setAttribute 설정된 변수값만 사용 가능
	3. 같은 이름이 다른 scope에도 존재하는 경우
		pageContext > request > session > application
		(단, scope 지정을 하지 않은 경우 page -> application 순차검색)
 --%>
 
 	<h2>표현식(Expression) 산술연산 사용 예</h2>
 	<div>
 		<ul>
 			<li>15 + 7 = <%=15 + 7 %></li>
 			<li>15 - 7 = <%=15 - 7 %></li>
 			<li>15 * 7 = <%=15 * 7 %></li>
 			<li>15 / 7 = <%=15 / 7 %></li>
 			<li>15 % 7 = <%=15 % 7 %></li>
 		</ul>
 	</div>
 	
 	<hr>
 	<h2>EL(Expression Language) 산술연산 사용 예</h2>
 	<div>
 		<ul>
 			<li>15 + 7 = ${15 + 7 }</li>
 			<li>15 - 7 = ${15 - 7 }</li>
 			<li>15 * 7 = ${15 * 7 }</li>
 			<li>15 / 7 = ${15 / 7 }</li><!-- double타입으로 표시 -->
 			<li>15 % 7 = ${15 % 7 }</li>
 		</ul>
 	</div>
 	
 	<div>
 		<h2>선언부, 스크립트릿 선언 변수 사용시</h2>
 		<p>표현식은 사용가능하나 EL에서는 사용못함(출력값 없음)</p>
 		<%! int su2 = 15 + 7; %>
 		<% int su3 = 15 - 7; %>
 		<ul>
 			<li>표현식 : 15 + 7 = <%=su2 %></li>
 			<li>표현식(스크립트릿 변수) : 15 - 7 = <%=su3 %></li>
 			<li>EL(선언부 변수) : 15 + 7 = ${su2 }</li>
 			<li>EL(스크립트릿 변수) : 15 - 7 = ${su3 }</li>
 		</ul>
 		
 		<h3>EL 사용시에는 해당스코프에 속성 정의</h3>
 		<ul>
 			<% pageContext.setAttribute("attr_su2", su2); %>
 			<li>속성정의 후 EL : 15 + 7 = ${attr_su2 }</li>
 		</ul>
 	</div>
 	
 	<hr>
 	<div>
 		<h2>동일한 이름의 속성명이 여러 scope에 존재할 때</h2>
 		<%-- <% pageContext.setAttribute("pc", "펜티엄 - pageContextScope"); %> --%>
 		<% request.setAttribute("pc", "i3 - requestScope"); %>
 		<% session.setAttribute("pc", "i5 - sessionScope"); %>
 		<% application.setAttribute("pc", "i7 - applicationScope"); %>
 		<ul>
 			<li>scope없이 호출 : ${pc }</li>
 		</ul>
 		<ol>
 			<li>pageScope 지정 : ${pageScope.pc }</li>
 			<li>requestScope 지정 : ${requestScope.pc }</li>
 			<li>sessionScope 지정 : ${sessionScope.pc }</li>
 			<li>applicationScope 지정 : ${applicationScope.pc }</li>
 		</ol>
 	</div>
</body>
</html>














