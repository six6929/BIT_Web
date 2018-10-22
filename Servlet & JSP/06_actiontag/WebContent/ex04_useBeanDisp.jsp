<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 데이터 표시</title>
</head>
<body>
<%--
	1.MemberVO 클래스 VO 객체 생성 : memberVO
	2.전달받은 파라미터 값을 memberVO 객체에 담기
	3.memberVO 객체에서 값 가져와서 화면 출력
--%>

	<jsp:useBean id="memberVO" class="com.mystudy.MemberVO"></jsp:useBean>
	
	<%--2.전달받은 파라미터 값을 memberVO 객체에 담기 --%>
	<jsp:setProperty property="*" name="memberVO"/>
	
	<h1>자바빈(Bean)을 이용한 파라미터 값 표시</h1>
	<h2>memberVO 객체 getter 사용</h2>
	<ul>
		<li>이름 : <%=memberVO.getName() %></li>
		<li>나이 : <%=memberVO.getAge() %></li>
		<li>암호 : <%=memberVO.getPwd() %></li>
		<li>성별 : <%=memberVO.getGender() %></li>
		<li>취미(배열값 처리) : 
			<%
			for(String hobby : memberVO.getHobby()) {
				out.print(hobby + "&nbsp;&nbsp;");
			}
			%>
		</li>
	</ul>
	
	<hr>
	<h2>JSP액션태그 getProperty 사용</h2>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="memberVO" /></li>
		<li>나이 : <jsp:getProperty property="age" name="memberVO" /></li>
		<li>암호 : <jsp:getProperty property="pwd" name="memberVO" /></li>
		<li>성별 : <jsp:getProperty property="gender" name="memberVO" /></li>
		
		<%--배열객체 hobby의 주소값 출력 --%>
		<li>취미 : <jsp:getProperty property="hobby" name="memberVO" /></li>
	</ul>
</body>
</html>