<%@page import="com.mystudy.mybatis.MemberVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전달받은 파라미터 값 중에 id값 사용
	String id = request.getParameter("id");
	
	//데이터 조회하고 가져오기
	//DB연결하고 SQL문을 실행하기 위한 SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	//								 mapper id명, 조회할 id
	MemberVO memberVO = ss.selectOne("selectOne", id); 
	ss.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 검색</title>
</head>
<body>
	<jsp:include page="main.jsp" />
	
	<h1>ID 검색 결과</h1>
	<%
	if(memberVO != null) {
	%>
	<ul>
		<li>
			<%=memberVO.getIdx() + "," %>
			<%=memberVO.getId() + "," %>
			<%=memberVO.getPwd() + "," %>
			<%=memberVO.getName() + "," %>
			<%=memberVO.getAge() + "," %>
			<%=memberVO.getAddress() + "," %>
			<%=memberVO.getReg() %>
		</li>
	</ul>
	<%
	} else {
	%>
		<h2>데이터 없음</h2>
	<%
	}
	%>
</body>
</html>