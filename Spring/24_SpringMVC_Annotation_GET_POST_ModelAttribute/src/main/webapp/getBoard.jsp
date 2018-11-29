<%@page import="com.spring.biz.board.impl.BoardDAO"%>
<%@page import="com.spring.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 전달받은 값으로 DB 데이타 조회하고 화면에 표시 --%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
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

thead th {
	text-align: center;
}

td a {
	color: white;
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

input[type=submit] {
	border: none;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>

	<div id="container">
		<h1>글 상세</h1>
		<p>
			<a href="logout.do">Log-out</a>
		</p>
		<hr>
		<form action="updateBoard.do" method="post">
			<input type="hidden" name="seq" value="${board.seq }">
			<table class="table table-bordered table-hover">
				<tr>
					<th scope="row" class="table-danger">제목</th>
					<td><input type="text" name="title" value="${board.title }">
					</td>
				</tr>
				<tr>
					<th scope="row" class="table-danger">작성자</th>
					<td><input type="text" name="writer" value="${board.writer }"
						readonly></td>
				</tr>
				<tr>
					<th scope="row" class="table-danger">내용</th>
					<td><textarea rows="10" cols="40" name="content">${board.content }</textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" class="table-danger">등록일</th>
					<td>${board.regdate }</td>
				</tr>
				<tr>
					<th scope="row" class="table-danger">조회수</th>
					<td>${board.cnt }</td>
				</tr>
				<tr>
					<td colspan="2" class="center"><input type="submit"
						value="글 수정" role="button"></td>
				</tr>
			</table>
		</form>
		<p>
			<a href="insertBoard.jsp">글 등록</a> 
			<a href="deleteBoard.do?seq=${board.seq }">글 삭제</a> 
			<a href="getBoardList.do">글 목록</a>
		</p>

	</div>

</body>
</html>