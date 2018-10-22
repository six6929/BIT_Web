<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 처리</title>
</head>
<body>
	<h2>일반적인 파라미터 처리 방법</h2>
	이름 : <%=request.getParameter("name") %>
	나이 : <%=request.getParameter("age") %>
	<hr>
	
	<h2>속성(attribute)을 이용(request)</h2>
	<%
		request.setAttribute("name", request.getParameter("name") + "-attr");
		request.setAttribute("age", request.getParameter("age") + "-attr");
	%>
	
		이름 : <%=request.getAttribute("name") %>
		나이 : <%=request.getAttribute("age") %>
		<hr>
		
		<hr>
		<%--
		액션태그 : <jsp:useBean></jsp:useBean>
		자바빈(Bean)을 이용해서 파라미터값을 표현
		자바빈(Bean)은 데이터를 저장 목적으로 JSP에서 제공되는 저장소
		1. VO객체 생성(자바 VO 클래스로 형식으로 작성된)
		2. 자바빈 생성(useBean 액션 태그<jsp:useBean></jsp:useBean>)
			id : 사용할 변수명 
			class : 실제클래스의 위치정보(패키지 + 클래스명)
			scope : default값 page, request, session, application
			<jsp:useBean id="별칭" class="VO위치" scope="page"></jsp:useBean>
		 --%>
		<h2>액션태그 useBean 사용 VO생성 및 값 설정</h2>
		<jsp:useBean id="person" class="com.mystudy.InfoVO" scope="page"/>
		 
		<%-- 
		com.mystudy.InfoVO person = new com.mystudy.InfoVO();</p>
		--%>
		
		<%--전달받은 파라미터명과 동일한 set 메소드를 호출해서 값 설정 --%>
		<%-- 
		<jsp:setProperty property="name" name="person"/> 
		<jsp:setProperty property="age" name="person"/> 
		--%>
		<jsp:setProperty property="*" name="person" />
		<%--
		person.setName(request.getParameter("name"));</p>
		--%>
		<h2>자바빈 객체의 getter 이용해서 값 표시</h2>
		<h2>이름 : <%=person.getName() %></h2>
		<h2>나이 : <%=person.getAge() %></h2>
		
		<hr>
		<h2>자바빈 객체의 getter 이용해서 값 표시(getProperty)</h2>
		<h2>이름 : <jsp:getProperty property="name" name="person" /></h2>
		<h2>나이 : <jsp:getProperty property="age" name="person" /></h2>
		
		<hr>
		<h2>자바빈 객체의 getter 이용해서 값 표시(EL)</h2>
		<h2>이름 : ${person.name }</h2>
		<h2>나이 : ${person.age }</h2>
</body>
</html>