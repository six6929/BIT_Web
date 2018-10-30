<%@page import="com.bc.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 vo객체를 사용해서 데이타 수정처리 
	0. 전달받은 데이타 추출
	1. 권한체크 암호 입력 받아 일치여부 확인 
	2. 암호 일치시 DB 데이타 수정, 불일치시 권한없음 메시지
--%>
<%-- 
<%
	//0. 전달받은 데이타 추출(session으로 부터)
	GuestbookVO vo = (GuestbookVO) session.getAttribute("guestbookVO");
	System.out.println("vo: " + vo);
	
	//EL,JSTL 적용 : vo값 출력 표현식 -> EL 대체
	//vo 객체를 scope 상에 등록하고 표현식을 EL구문으로 변경
	pageContext.setAttribute("vo", vo);
%>
--%>
<%-- EL,JSTL 적용 : session 영역에 있는 guestbookVO 객체를 사용해서 
	EL로 데이타 표시 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<link href="./css/guestbook.css" rel="stylesheet" type="text/css">
<script>
	//2. 암호 일치시 DB 데이타 수정, 불일치시 권한없음 메시지
	function save_go(frm) {
		//입력된 비밀번호와 DB에 저장된 비밀번호 일치여부 확인
		var pwd1 = frm.pwd.value; //새로 입력한 비밀번호
		var pwd2 = "${guestbookVO.getPwd() }";
		if (pwd1 != pwd2) {
			alert("암호가 일치하지 않습니다.");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		
		//수정처리작업 페이지로 이동
		frm.action = "update_ok.jsp"; 
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 수정화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	<form method="post">
		<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="name" value="${guestbookVO.getName() }">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" value="${guestbookVO.getSubject() }">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email" value="${guestbookVO.getEmail() }">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60">${guestbookVO.getContent() }</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수 정"
						onclick="save_go(this.form)">
					<input type="reset" value="초기화">
				</td>
			</tr>
			<input type="hidden" name="idx" value="${guestbookVO.getIdx() }">
		</tfoot>	
		</table>
	</form>
</div>

</body>
</html>





