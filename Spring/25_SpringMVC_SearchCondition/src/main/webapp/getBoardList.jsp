<%@page import="java.util.List"%>
<%@page import="com.spring.biz.board.impl.BoardDAO"%>
<%@page import="com.spring.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- DB데이타 조회하고 조회된 데이타를 화면 출력 --%>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<style>
#container {
	width: 700px;
	margin: 0 auto;
}

h1, h3 {
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

.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

input[type="text"] {
	border: none;
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
		<h1>글목록</h1>
		<h3>
			${userName }님 환영합니다....<a href="logout.do">Log-out</a>
		</h3>

		<!-- 검색을 위한 폼 -->
		<form action="getBoardList.do" method="post">
			<table class="border-none">
				<tr>
					<td><select name="searchCondition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
					</select> <input type="text" name="searchKeyword"> <input
						type="submit" value="검색"></td>
				</tr>
			</table>
		</form>

		<!-- 데이타 표시 -->
		<form>
			<table class="table table-bordered table-hover table-sm">
				<thead>
					<tr>
						<th scope="col" class="table-danger">번호</th>
						<th scope="col" class="table-danger">제목</th>
						<th scope="col" class="table-danger">작성자</th>
						<th scope="col" class="table-danger">등록일</th>
						<th scope="col" class="table-danger">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="boardList" items="${boardList }">
						<tr>
							<td class="center">${boardList.seq }</td>
							<td><a href="getBoard.do?seq=${boardList.seq }"
								role="button"> ${boardList.title } </a></td>
							<td>${boardList.title }</td>
							<td>${boardList.regdate }</td>
							<td class="center">${boardList.cnt }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<br>
		<p class="center">
			<a href="insertBoard.jsp">새글등록</a>
		</p>
	</div>


</body>
</html>






