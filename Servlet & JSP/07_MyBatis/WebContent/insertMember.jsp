<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파라미터 값 추출
	/*
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pw");
	int age = Integer.parseInt(request.getParameter("age"));
	String addr = request.getParameter("addr");

	 
	//MemberVO 타입의 객체에 파라미터값 설정
	MemberVO memberVO = new MemberVO();
	memberVO.setId(request.getParameter("id"));
	memberVO.setPwd(request.getParameter("pw"));
	memberVO.setName(request.getParameter("name"));
	*/
%>
	 <%-- MemberVO 타입의 객체에 파라미터값 설정 --%>
	 <jsp:useBean id="memberVO" class="com.mystudy.mybatis.MemberVO"/>
	 
	 <%--파라미터명과 일치하는 setter에 일괄 값 설정 --%>
	 <jsp:setProperty property="*" name="memberVO"></jsp:setProperty>
	 
<%
	//SqlSession 객체 생성
	//.openSession(), .openSession(false) : 자동커밋 아님
	//.openSession(true) : 자동커밋
	SqlSession ss = DBService.getFactory().openSession();

	//유일한 id인 경우 namespace 생략 가능
	int result = ss.insert("insertMember", memberVO);
	ss.commit();
	ss.close();
	
	//페이지이동(selectAll.jsp)
	if(result > 0) {//DB에 최종 반영 처리
		response.sendRedirect("selectAll.jsp");
	} else { //입력건수가 없는 경우
%>
		<script>
			alert("입력건수 : 0건");
		</script>
<%
		response.sendRedirect("selectAll.jsp");
	}
	//SqlSession 객체를 이용 insert SQL문(insertMember)실행
	
	//페이지 이동 selectAll.jsp
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>