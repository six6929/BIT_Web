<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<style>
#container {
	width: 700px;
	margin: 0 auto;
}

h1, h3, p {
	text-align: center;
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid black;
	margin: 0 auto;
}

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

input[type="text"] {
	border: none;
}

textarea {
	border :none;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>

	<div id="container">
		<h1>글등록</h1>
		<p>
			<a href="logout.do">Log-out</a>
		</p>
		<hr>
		<form action="insertBoard.do" method="post">
			<table class="table table-bordered table-hover">
				<tr>
					<th scope="row" class="table-danger">제목</th>
					<td><input type="text" name="title" size="30"></td>
				</tr>
				<tr>
					<th scope="row" class="table-danger">작성자</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th scope="row" class="table-danger">내용</th>
					<td><textarea name="content" rows="10" cols="40"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="center"><input type="submit"
						value="새글 등록"></td>
				</tr>
			</table>
		</form>
		<p>
			<a href="getBoardList.jsp">글 목록 가기</a>
		</p>
	</div>

</body>
</html>





