<%@page import="com.bc.mybatis.GuestBookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB에 저장된 데이타 확인을 위한 vo 객체 생성
	(session 저장된 값 사용)
--%>
<%
	GuestBookVO vo = (GuestBookVO)session.getAttribute("guestbookVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<%-- 스타일 적용 --%>
<link href="./css/guestbook.css" rel="stylesheet" type="text/css">
<script>
<%-- del_go 함수 작성 
	암호가 일치하면 : delete_ok.jsp 페이지로 이동 idx값 전달
	암호 불일치 : 암호 다시 입력받도록 현재 페이지로 이동
--%>
	function del_go(frm) {
		//비밀번호 일치 확인 : 현재페이지 pwd값과 vo의 pwd값 비교
		var pwd1 = frm.pwd.value;
		var pwd2 = "<%=vo.getPwd() %>";
		//암호 일치하면 delete_ok.jsp 페이지 이동(삭제처리)
		//암호 불일치 : 비밀번호 불일치 메시지 표시 후 현재 페이지
		if(pwd1 != pwd2) {
			alert("암호 불일치");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		var isDeleteOk = confirm("정말 삭제 하시겠습니까?");
		frm.action = "delete_ok.jsp?idx=<%=vo.getIdx() %>";
		frm.submit();
		
	}
</script>

</head>
<body>

<div id="container">
	<h2>방명록 : 삭제화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	<form method="post">
		<table>
		<tbody>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
				<td>
					<input type="button" value="삭 제"
						onclick="del_go(this.form)">
					<input type="hidden" name="idx" value="<%=vo.getIdx() %>">
				</td>
			</tr>
		</tbody>
		</table>
	</form>
</div>		

</body>
</html>