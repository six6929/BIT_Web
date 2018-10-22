<%@page import="com.mystudy.mybatis.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 목록 조회</title>
</head>
<body>
	<jsp:include page="main.jsp"/>
	
	<h1>전체 데이타 조회</h1>
<%--
	//DB의 member2테이블에서 전체 데이타 조회
	openSession(), openSession(false) : Auto Commit 상태 아님
		- Select문이거나 트랜잭션을 실행할 때 Auto Commit 상태 아님
		- Insert, Update, Delete 실행하고 commit 처리를 해야 
		  DB에 최종 반영됨
	openSession(true) : Auto Commit 상태
	
	//------------------------
	//mapper에 정의되어 있는 id명을 찾아 해당 SQL문을 실행하고 결과 리턴
	SqlSession.selectOne(mapper의 id명) : select결과가 하나인 경우(0, 1개)
	SqlSession.selectList(mapper의 id명) : select결과가 여러개인 경우(0, n개)
--%>
<%	
	//SqlSession 객체를 얻기(Auto commit 아님)
	SqlSession ss = DBService.getFactory().openSession();
	
	//데이타 가져오기
	List<MemberVO> memberList = ss.selectList("member2.selectAll");
	//System.out.println("memberList: " + memberList);
	ss.close();
	
	//데이터 출력 UL 태그로 작성
	out.println("<ul>");
	for (MemberVO vo : memberList) {
		out.println("<li>");
		out.println(vo.getIdx() + ",");
		out.println(vo.getId() + ",");
		out.println(vo.getPwd() + ",");
		out.println(vo.getName() + ",");
		out.println(vo.getAge() + ",");
		out.println(vo.getAddress() + ",");
		out.println(vo.getReg());
		out.print(vo.getReg().substring(0, 10));
		
		out.println("</li>");
	}
	out.println("</ul>");
%>
</body>
</html>







