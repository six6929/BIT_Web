<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 품목 계산하기</title>
</head>
<body>
	<h2>계산</h2>
	<h3>선택한 품목(장바구니)</h3>
	
<%
	ArrayList<String> list = (ArrayList<String>)session.getAttribute("product_list");
	if(list == null) {
		out.print("<p>선택 품목이 없습니다.</p>");
	} else { //품목이 있으면
		out.print("<ul>");
		for(String product : list) {
			out.print("<li>" + product + "</li>");
		}
		out.print("</ul>");
	}
%>
	<%-- 	
	<p>선택 품목이 없습니다.</p>
	품목이 있으면
	<ul>
		<li>수박</li>
		<li>사과</li>
	</ul> --%>
</body>
</html>