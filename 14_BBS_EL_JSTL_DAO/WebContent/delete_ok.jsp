<%@page import="com.bc.mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이타를 DB에서 삭제 처리 --%>
<%
	request.setCharacterEncoding("UTF-8");

	String b_idx = request.getParameter("b_idx");
	
	//DB 데이타 삭제 처리
	try {
		DAO.delete(b_idx);
		//페이지 이동
		response.sendRedirect("list.jsp?cPage=" + session.getAttribute("cPage"));
	} catch (Exception e) {
		//삭제 처리중 예외 발생한 경우(댓글이 있는 경우)
%>
		<script>
			alert("댓글이 있는 경우 삭제할 수 없습니다.");
			history.go(-2);
		</script>
<%		
	}
%>	
