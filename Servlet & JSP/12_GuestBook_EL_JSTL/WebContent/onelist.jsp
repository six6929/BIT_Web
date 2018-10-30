<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 idx값 사용 DB에서 데이타 조회 후 화면표시 --%>
<%
	//전달받은 idx값 추출
	String idx = request.getParameter("idx");
	
	//데이타베이스 연결 및 데이타 가져오기
	//1. SqlSession 객체 생성하기(DBService 사용)
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. SqlSession 객체 사용해서 SQL문장 실행(idx 전달)
	//GuestbookVO vo = ss.selectOne("one", idx);
	session.setAttribute("guestbookVO", ss.selectOne("one", idx));
	ss.close();
	
	//3. 조회된 데이타 사용 - HTML문장에 데이타 표시
	
	//vo객체를 계속 사용할 수 있도록 session 영역에 등록
	//수정, 삭제 작업시 사용하기 위함
	//session.setAttribute("guestbookVO", vo);
%>
<%--========================
	EL,JSTL 적용해서 변경 처리 
	session 스코프(scope)에 guestbookVO 이름으로 
	저장된 GuestbookVO 타입의 객체를 사용해서 EL로 데이타 출력   
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<%-- 스타일 적용을 위한 링크 설정 --%>
<link href="./css/guestbook.css" rel="stylesheet" type="text/css">
<script>
	function update_go(frm) {
		frm.action = "update.jsp";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "delete.jsp";
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 상세화면</h2>
	<hr>
	<p>[<a href="list.jsp">목록으로 이동</a>]</p>
	<form method="post">
		<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td>${guestbookVO.getName() }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${guestbookVO.getSubject() }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${guestbookVO.getEmail() }</td>
			</tr>
			<tr>
				<td colspan="2">
					<pre>${guestbookVO.getContent() }</pre>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정"
						onclick="update_go(this.form)">
					<input type="button" value="삭 제"
						onclick="delete_go(this.form)">
				</td>
			</tr>
		</tfoot>	
		</table>
	</form>
</div>

</body>
</html>





