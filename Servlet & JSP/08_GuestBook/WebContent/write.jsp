<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력화면 작성하고 작성된 데이타를 
	write_ok.jsp 페이지로 전달
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/guestbook.css" rel="stylesheet" type="text/css">
<style>
	th{
		width: 40%;
	}
	.textbox{
		width: 98%;
	}
</style>
</head>
<body>
<div id="container">
		<h2>방명록 등록</h2>
		<hr>
		<p><a href="list.jsp">[목록으로이동]</a></p>
		<form method="post" action="write_ok.jsp">
		<table>

				<tr>
					<th>작성자</th>
					<td class="center"><input type="text" class="textbox" name="name"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td class="center"><input type="text" class="textbox"  name="subject"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td class="center"><input type="text" class="textbox"  name="email"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td class="center"><input type="text" class="textbox"  name="pwd"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td ><textarea name="content" rows="8" cols="40" margin="auto"></textarea></td>
				</tr>
				<tfoot>
					<td colspan="2">
					<input type="submit" value="전  송">
					<input type="reset" value="초기화">
					</td>
				</tfoot>
		</table>
		</form>
	</div>	
</body>
</html>