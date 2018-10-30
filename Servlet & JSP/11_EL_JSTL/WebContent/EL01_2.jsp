<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 문자열연산, 비교연산자, 논리연산자</title>
</head>
<body>
	<h1>EL 문자열연산, 비교연산자, 논리연산자</h1>
	<h2>EL 문자열 연산</h2>
	<p>"Hello" + "World!!!" = "Hello World!!!"</p>
	<p>표현식 : "Hello" + "World!!!" = <%="Hello" + " World!!!" %></p>
	<!--
		EL에서는 문자열 붙이기를 하려면 += 를 사용해야한다.
	 -->
	 <h3>EL의 문자열 붙이기 : += 기호 사용(+부호 사용시 예외발생)</h3>
	<p>EL : "Hello" + "World!!!" = ${"Hello" += " World!!!" }</p>
	<hr>
	
	<h2>EL 비교연산자</h2>
	<%-- ==, !=, <, >, <=, >= --%>
	<p> ■ 비교연산자(부호) : ==, !=, &lt; , &gt;, &lt;=, &gt;=</p>
	
	<p> ■ 비교연산자(영문) : eq, ne, lt , gt, le, ge 사용가능</p>
	<p>100 > 50 : ${100 > 50 }</p>
	<p>100 &gt; 50 : ${100 gt 50 }</p>
	
	<p>100 >= 50 : ${100 >= 50 }</p>
	<p>100 ge 50 : ${100 ge 50 }</p>
	<hr>
	
	<h2>EL 논리연산자(&&, ||, !, and, or, not)</h2>
	<p> ■ 논리연산자(부호) : &&, ||, ! 사용가능</p>
	<p> ■ 논리연산자(영문) : and, or, not 사용가능</p>
	<p> 100 > 50 && 200 > 100 : ${100 > 50 && 200 > 100 }</p>
	<p> 100 > 50 and 200 > 100 : ${100 > 50 and 200 > 100 }</p>
	
	<p>!(100 > 50 && 200 > 100) : ${!(100 > 50 && 200 > 100) }</p>
	<p>!(100 > 50 and 200 > 100) : ${not(100 > 50 and 200 > 100) }</p>
	
	
	
	
	
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>