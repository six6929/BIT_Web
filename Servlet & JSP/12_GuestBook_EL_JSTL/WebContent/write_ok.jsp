<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이타를 DB에 저장 
	입력성공 : 데이타 입력성공 메시지 표시 후 목록페이지 이동
	입력실패 : 입력실패 메시지 표시후 이전화면(입력페이지) 이동
--%>
<%-- 전달받은 데이타를 사용해서 DB에 입력 작업 진행 --%>
<%
	//(실습) mapper SQL 작성 + DB 입력 처리
	//0. 한글처리를 위한 request의 encoding 타입 UTF-8 설정
	request.setCharacterEncoding("UTF-8");
%>
	<%--//1. GuestbookVO 타입의 vo 객체 생성 --%>
	<jsp:useBean id="vo" class="com.bc.mybatis.GuestbookVO"/>

	<%-- //2. 파라미터로 전달받은 데이타를 추출해서 vo에 설정 --%>
	<jsp:setProperty property="*" name="vo"/>
	
<%	
	//3. SqlSession 객체 생성(DB 연동작업용)
	SqlSession ss = DBService.getFactory().openSession(true);
	
	//4. mapper의 SQL을 사용해서 DB 데이타 update 처리
	//   (파라미터로 GuestbookVO 타입의 vo 객체 전달)
	int result = ss.insert("insert", vo);
	//ss.commit();
	ss.close();
	
	//5. 입력처리 후 목록페이지(list.jsp)로 이동
	//5-1. 입력건수가 0 보다 크면 : list.jsp 로 이동
	//5-2. 입력건수 0 이면 : 메시지(입력처리 되지 않았습니다) + 이전페이지로 이동
	if (result > 0) {
%>		
	<script>
		alert("정상 입력처리 되었습니다.\n목록 페이지로 이동합니다.");
		location.href = "list.jsp";
	</script>
<%	
	} else  {
%>		
	<script>
		alert("[예외]입력처리되지 않았습니다.");
		history.back();
	</script>
<%
	}
	
%>

