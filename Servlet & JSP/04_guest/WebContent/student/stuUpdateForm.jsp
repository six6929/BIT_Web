<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>
</head>
<body>
<table border="1" width="800px">
	<tr>
		<th width="250">
			<a href="main.jsp">
			<img src="../imgs/bitcamp_logo.png" 
				alt="로고" width="200px">
			</a>
		</th>
		<th width="100px"><a href="stuList.jsp">조회</a></th>
		<th width="100px"><a href="stuForm.jsp">학생등록</a></th>
		<th width="100px" bgcolor="orange"><a href="stuAdd.jsp">성적입력</a></th>
		<th width="100px"><a href="stuDel.jsp">데이타삭제</a></th>
	</tr>
	<tr>
		<td colspan="5" height="400">
			<center>
			<h1>성적 입력(수정)</h1>
			<form action="stuUpdate.jsp">
				<table>
					<tr>
						<th>학번</th>
						<td><input type="text" name="idx"
								value="<%=request.getParameter("idx") %>" readonly>
						</td>
					</tr>
					<tr>
						<th>국어</th>
						<td><input type="text" name="kor"></td>
					</tr>
					<tr>
						<th>영어</th>
						<td><input type="text" name="eng"></td>
					</tr>
					<tr>
						<th>수학</th>
						<td><input type="text" name="math"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="입력">
						</td>
					</tr>
				</table>
			</form>
			</center>
		</td>
	</tr>
</table>
</body>
</html>