<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션범위</title>
<script>
	//세션 속성값 설정
	function sessionSet() {
		location.href = "ex01_sessionSet.jsp";
	}
	
	//세션 속성 삭제
	function sessionRemove() {
		location.href= "ex01_sessionRemove.jsp";
	}
	
	//세션 초기화
	function sessionInit() {
		location.href = "ex01_sessionInvalidate.jsp";
	}
</script>
</head>
<body>
<%
	String name = null;
	String age = null;
	
	if(session.getAttribute("attr_name") != null) { 
		name = (String)session.getAttribute("attr_name") + "-세션에서 가져온 값";
	} else {
		name = "세션 값 없음";
	}
	if(session.getAttribute("attr_age") != null) {
		age = (String)session.getAttribute("attr_age") + "-세션에서 가져온 값";
	} else {
		age = "세션 값 없음";
	}
%>
	<h1>세션 테스트</h1>
	<input type="button" value="세션 속성에 저장" onclick="sessionSet()">
	<input type="button" value="세션 속성 삭제" onclick="sessionRemove()">
	<input type="button" value="세션 속성 초기화" onclick="sessionInit()">
	<hr>
	<h2>이름 : <%=name %></h2>
	<h2>나이 : <%=age %></h2>
	
	<hr>
	<h2>세션유지시간 확인(단위 초)</h2>
	<h2>세션유지시간 확인(단위 초): session.getMaxInactiveInterval()</h2>	
	<h2>세션유지시간 확인(기본 30초): <%=session.getMaxInactiveInterval() %></h2>	
</body>
</html>