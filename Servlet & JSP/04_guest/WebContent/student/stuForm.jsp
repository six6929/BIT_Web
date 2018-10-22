<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="800px">
	<tr>
		<th width="250">
			<a href="main.jsp">
			<img src="../imgs/bitcamp_logo.png" alt="로고" width="200px">
			</a>
		</th>
		<th width="100px">
			<a href="stuList.jsp">조회</a>
		</th>
		<th width="100px" bgcolor="orange">
			<a href="stuForm.jsp">학생등록</a>
		</th>
		<th width="100px">
			<a href="stuAdd.jsp">성적입력</a>
		</th>
		<th width="100px">
			<a href="stuDel.jsp">데이터삭제</a>
		</th>
	</tr>
	<tr>
		<td colspan="5" height="400">
		<center>
			<h1>학생 정보 입력</h1>
			<form action="stuInsert.jsp">
			<table border="1">
				<tr>
					<th>학번</th>
					<td><input type="text" name="idx"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="입  력">
						<input type="reset" value="취   소">
					</td>
				</tr>
			</table>
			</form>
		</center>
	</tr>
</table>
</body>
</html>