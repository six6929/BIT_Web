<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL02.jsp</title>
</head>
<body>
	<h1>JSTL02.jsp</h1>
	<p>이름(name) : ${name }</p>
	<p>나이(age) : ${age }</p>
	<hr>
	<h3>파라미터 값 받아서 표시(param)</h3>
	<p>이름(name) : ${param.name }</p>
	<p>나이(age) : ${param.age }</p>
	<hr>
	
	<h2>page영역에 속성값(name) 설정 후</h2>
<%
	String name = request.getParameter("name");
	pageContext.setAttribute("attr_name", name);
%>	
	
	<p>이름(\${name }) : ${name }</p>
	<p>이름(\${attr_name }) : ${attr_name }</p>
	
	<hr><hr>
	
	<h2>숫자 포맷 지정 태그 - formatNumber</h2>
	<%--
		mixIntegerDigits : 정수부의 최소표시 자리수 지정(없으면 0 표시)
		minFractionDigits : 소수부(소수점이하) 최소자리 지정(없으면 0 표시)
		
		maxIntegerDigits : 정수부 최대표시 자리수 지정(넘치면 버려짐)
		maxFractionDigits : 소수부(소수점이하) 표시자리수 지정(없으면 0 표시)
			(넘치면버려짐, 단 숫자값 6이상이면 올림처리)
	--%>
	<fmt:formatNumber value="123" type="number"/><br>
	<fmt:formatNumber value="123" type="number" minIntegerDigits="10"/><br>
	<fmt:formatNumber value="123.456" type="number" minFractionDigits="2"/><br>
	<fmt:formatNumber value="123" type="number" minFractionDigits="2"/><br>
	
	<fmt:formatNumber value="123" type="number" maxIntegerDigits="1"/><br>
	<fmt:formatNumber value="123.456" type="number" maxFractionDigits="2"/><br>
	<fmt:formatNumber value="123.4" type="number" maxFractionDigits="2"/><br>
	<fmt:formatNumber value="123.4" type="number" maxFractionDigits="2" minFractionDigits="2"/><br>
	<hr>
	
	
	<h2>formatNumber : pattern 속성값 적용</h2>
	<fmt:formatNumber value="123456.78" pattern=".000"/><br>
	<fmt:formatNumber value="123456.78" pattern=".###"/><br>
	
	<fmt:formatNumber value="123456.7891" pattern=".000"/><br>
	<fmt:formatNumber value="123456.7891" pattern=".###"/><br>
	
	<fmt:formatNumber value="123456.8886" pattern=".000"/><br>
	<fmt:formatNumber value="123456.8886" pattern=".###"/><br>
	
	<hr>
	<%--자리수 이하 값이 5일때 부터 올림 처리 --%>
	<fmt:formatNumber value="123456.8885" pattern=".000"/><br>
	<fmt:formatNumber value="123456.8885" pattern=".###"/><br>
	
	<%--자리수 이하 값이 4이하인 경우 버림 처리 --%>
	<fmt:formatNumber value="123456.8884" pattern=".000"/><br>
	<fmt:formatNumber value="123456.8884" pattern=".###"/><br>
	<hr>
	
	<%-- ========================================== --%>
	<h2>정수부 패턴 속성 적용(#, ###.## / 0,000.00)</h2>
	<fmt:formatNumber value="11123456.784" pattern="#,###.##" /><br>
	<fmt:formatNumber value="11123456.784" pattern="0,000.00" /><br>
	<fmt:formatNumber value="11123456.784" pattern="0,000.0#" /><br>
	
	<fmt:formatNumber value="1.785" pattern="#,###.##" /><br>
	<fmt:formatNumber value="1.785" pattern="0,000.00" /><br>
	
	<fmt:formatNumber value="1" pattern="#,###.##" /><br>
	<fmt:formatNumber value="1" pattern="0,000.00" /><br>
	<fmt:formatNumber value="1" pattern="0,000.0#" /><br>
	
	<h3>7 / 3 결과값 출력</h3>
	<c:set var="k" value="${7 / 3 }"/>
	<c:out value="${k }"/>
	
	<fmt:formatNumber value="${k }" pattern="#,##0"/><br>
	<fmt:formatNumber value="${k }" pattern="#,##0.0"/><br>
	<fmt:formatNumber value="${k }" pattern="#,##0.00"/><br>
	
	<%-------======================================== --%>
	<h2>formatDate 사용 날짜 출력</h2>
	<%
	Date now = new Date();
	%>
	표현식 : <%=now %>
	<% pageContext.setAttribute("now", now); %>
	
	<h3>formatDate 사용(날짜표시)</h3>
	dateStyle 설정안함 : <fmt:formatDate value="${now }"/><br>
	dateStyle="short" : <fmt:formatDate value="${now }" dateStyle="short"/><br>
	dateStyle="medium" : <fmt:formatDate value="${now }" dateStyle="medium"/><br>
	dateStyle="long" : <fmt:formatDate value="${now }" dateStyle="long"/><br>
	dateStyle="full" : <fmt:formatDate value="${now }" dateStyle="full"/><br>
	
	<h3>formatDate 사용(시간표시)</h3>
	timeStyle 설정안함 : <fmt:formatDate type="time" value="${now }"/><br>
	timeStyle="short" : <fmt:formatDate type="time" value="${now }" timeStyle="short"/><br>
	timeStyle="medium" : <fmt:formatDate type="time" value="${now }" timeStyle="medium"/><br>
	timeStyle="long" : <fmt:formatDate type="time" value="${now }" timeStyle="long"/><br>
	timeStyle="full" : <fmt:formatDate type="time" value="${now }" timeStyle="full"/><br>
	<hr>
	
	<h3>formatDate 사용(날짜, 시간표시)</h3>
	<fmt:formatDate type="both" value="${now }"/><br>
	<fmt:formatDate type="both" value="${now }" timeStyle="short"/>
	<fmt:formatDate type="both" value="${now }" timeStyle="medium"/><br>
	<fmt:formatDate type="both" value="${now }" timeStyle="long"/><br>
	<fmt:formatDate type="both" value="${now }" timeStyle="full"/><br>
</body>
</html>












