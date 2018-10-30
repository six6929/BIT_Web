<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 idx 값에 해당하는 DB데이타 삭제 
	삭제했으면 : 삭제했다 메시지 표시 후 전체목록 페이지로 이동
	삭제못했으면 : 삭제못했다 메시지 표시 후 전체목록 페이지로 이동
--%>
<%
	String idx = request.getParameter("idx");
	//System.out.println("delete_ok.jsp idx: " + idx);
	
	//SqlSession 객체 생성(DB 연동작업용)
	SqlSession ss = DBService.getFactory().openSession(true);
	
	//mapper의 SQL을 사용해서 DB 데이타 update 처리
	//   (파라미터로 GuestbookVO 타입의 vo 객체 전달)
	int result = ss.delete("delete", idx);
	//ss.commit();
	ss.close();
	
	if (result > 0) {
%>		
	<script>
		alert("삭제처리 되었습니다.\n목록페이지로 이동합니다.");
		location.href = "list.jsp";
	</script>
<%		
	} else {
%>
	<script>
		alert("[예외]삭제하지 못했습니다.\n목록페이지로 이동합니다.");
		location.href = "list.jsp";
	</script>
<%		
	}
	
%>
