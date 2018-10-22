<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 idx 값에 해당하는 DB데이터 삭제
	 삭제했으면 : 삭제했다 메시지 표시 후 전체목록 페이지로 이동
	 삭제못했으면 : 삭제못했다 메시지 표시 후 전체목록 페이지로 이동
--%>

<%
	//파라미터 변수 받아오기
	String idx = request.getParameter("idx");

	//SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession(true);
	int result = ss.delete("delete", idx);
	ss.close();
	
	//삭제했으면 : 삭제했다 메시지 표시 후 전체목록 페이지로 이동
	//삭제못했으면 : 삭제못했다 메시지 표시 후 전체목록 페이지로 이동
	if(result > 0) {
%>
		<script>
			alert("삭제성공하셨습니다.");
			location.href="list.jsp";
		</script>
<%
	} else {
%>
	<script>
		alert("삭제를 실패하셨습니다.");
		location.href="list.jsp";
	</script>
<%	
	}
	
%>