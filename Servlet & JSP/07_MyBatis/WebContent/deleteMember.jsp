<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 id값에 해당하는 데이터 삭제 처리--%>
<%
	//전달받은 파라미터 값 중에 id 추출
	String id = request.getParameter("id");

	//SqlSession 객체 생성(auto commit 처리방식 사용)
	SqlSession ss = DBService.getFactory().openSession(true);
	
	int result = ss.delete("deleteMember", id);
	ss.close();
	
	if(result > 0) {//데이터 삭제 처리 1건 이상
		response.sendRedirect("selectAll.jsp");
	} else {//삭제건수 0건
%>
	<script>
		alert("삭제된 데이터가 없습니다.");
		location.href = "selectAll.jsp";
	</script>
<%
	}
%>