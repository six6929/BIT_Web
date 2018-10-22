<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestBookVO"/>
	 
	<jsp:setProperty property="*" name="vo"></jsp:setProperty>
<%	
	SqlSession ss = DBService.getFactory().openSession(true);
	 
	int result = ss.insert("insert", vo);
	ss.close();
	

	if(result > 0) {
		response.sendRedirect("list.jsp");
	} else { 
%>
		<script>
			alert("입력건수 : 0건");
		</script>
<%
		response.sendRedirect("write.jsp");
	}
	//SqlSession 객체를 이용 insert SQL문(insertMember)실행
	
	//페이지 이동 selectAll.jsp
%>
%>