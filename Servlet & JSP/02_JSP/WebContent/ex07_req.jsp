<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리 요청</title>
</head>
<body>
	<h2>성적처리 요청</h2>
	<form action="ex07_resp.jsp">
		<p>이름 : <input type="text" name="name"></p>
		<p>국어 : <input type="text" name="kor"></p>
		<p>영어 : <input type="text" name="eng"></p>
		<p>수학 : <input type="text" name="math"></p>
		
		<input type="submit" value="성적처리요청">
	</form>
</body>
</html>