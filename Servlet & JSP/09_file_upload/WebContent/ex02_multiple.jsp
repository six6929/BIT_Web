<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러개 파일 업로드(ex02_multiple.jsp)</title>
</head>
<body>
	<form action="ex02_result.jsp" method ="post" enctype="multipart/form-data">
		<h2>올린사람 : <input type="text" name="name"></h2>
		<h2>파일제목 : <input type="text" name="title"></h2>
		<h2>파일 1 : <input type="file" name="f_name1"></h2>
		<h2>파일 2 : <input type="file" name="f_name2"></h2>
		<h2>파일 3 : <input type="file" name="f_name3"></h2>
		<input type="submit" value="파일업로드">
	</form>
</body>
</html>