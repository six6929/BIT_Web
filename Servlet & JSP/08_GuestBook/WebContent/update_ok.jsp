<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.GuestBookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB에 수정 작업 진행 --%>
<%
	//0. 한글처리를 위한 request의 encoding 타입 UTF-8 설정
	request.setCharacterEncoding("utf-8");

	//1. GuestbookVO 타입의 vo 객체를 생성
	//2. 파라미터로 전달받은 데이터를 추출해서
%>
 	<jsp:useBean id="vo" class="com.bc.mybatis.GuestBookVO"/>
	<jsp:setProperty property="*" name="vo"></jsp:setProperty> 
<%
	//3. SqlSession 객체 생성 (DB 연동작업용)
	SqlSession ss = DBService.getFactory().openSession(true);
	
	int result = ss.update("update", vo);
	ss.close();
	
	//4. mapper의 SQL을 사용해서 DB 데이터 update 처리
	//	 (파라미터로 GuestbookVO 타입의 vo 객체 전달)
 	
	//5.  수정처리 후 상세페이지(onelist.jsp)로 이동
	//5-1. 수정건수가 0 보다 크면 : onelist.jsp로 이동
	//	 수정건수가 0 이면 메시지(수정처리 되지 않았습니다) + 이전페이지로 이동
	
	if(result > 0) {
		response.sendRedirect("onelist.jsp?idx=" + vo.getIdx());
	} else {
%>
		<script>
		alert("수정처리 되지 않았습니다.");
		</script>
<%
		response.sendRedirect("update.jsp");
	}
%>
