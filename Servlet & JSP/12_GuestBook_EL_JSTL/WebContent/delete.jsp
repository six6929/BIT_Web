<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB에 저장된 데이타 확인을 위한 vo 객체 생성
	(session 저장된 값 사용)
--%>
<%-- EL적용 : session scope에 있는 guestbookVO 사용으로 삭제 처리
<%
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
	System.out.println("delete.jsp vo: " + vo);
%>
--%>
<%--=========================
	EL,JSTL 적용 
	표현식으로 데이타 표시 -> EL로 변경
	session scope에 있는 guestbookVO에 저장된 객체 사용
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
<%-- 스타일 적용 guestbook.css --%>
<link href="./css/guestbook.css" rel="stylesheet" type="text/css">
<script>
<%-- del_go 함수 작성 
	암호가 일치하면 : delete_ok.jsp 페이지로 이동 idx값 전달
	암호 불일치 : 암호 다시 입력받도록 현재 페이지로 이동
--%>
	function del_go(frm) {
		//비밀번호 일치 확인 : 현재페이지 pwd값과 vo의 pwd값 비교
		var DBPwd = "${guestbookVO.getPwd() }"; 
		var inputPwd = frm.pwd.value;
		//alert("DBPwd: " + DBPwd + ", inputPwd: " + inputPwd);
		if (DBPwd == inputPwd) {//암호 일치하는 경우
			//암호 일치하면 delete_ok.jsp 페이지 이동(삭제처리)
			var isDeleteOk = confirm("정말 삭제 하시겠습니까?");
			if (isDeleteOk) {
				frm.action = "delete_ok.jsp?idx=${guestbookVO.getIdx() }";
				frm.submit();
			} 
		} else {//암호 다른 경우
			//암호 불일치 : 비밀번호 불일치 메시지 표시 후 현재 페이지
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
		}		
		frm.pwd.value = "";
		frm.pwd.focus();
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
				<td><input type="text" name="pwd"></td>
				<td>
					<input type="button" value="삭 제"
						onclick="del_go(this.form)">
				</td>
			</tr>
		</tbody>
		</table>
	</form>
</div>		

</body>
</html>