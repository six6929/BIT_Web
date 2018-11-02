<%@page import="com.bc.model.vo.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		frm.action = "MyCon?type=update"; 
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 수정화면</h2>
	<hr>
	<p><a href="MyCon?type=list">[목록으로 이동]</a></p>
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
			<input type="hidden" name="update_chk" value="chk">
		</tfoot>	
		</table>
	</form>
</div>

</body>
</html>





