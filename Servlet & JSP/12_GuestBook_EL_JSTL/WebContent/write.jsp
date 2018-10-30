<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력화면 작성하고 작성된 데이타를 
	write_ok.jsp 페이지로 전달(post 방식)
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성</title>
<link href="./css/guestbook.css" rel="stylesheet" type="text/css">
<script>
	function save_go(frm) {
		frm.action = "write_ok.jsp";
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>방명록 : 입력화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	<form method="post">
		<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="저 장"
						onclick="save_go(this.form)">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</tfoot>	
		</table>
	</form>
</div>

</body>
</html>