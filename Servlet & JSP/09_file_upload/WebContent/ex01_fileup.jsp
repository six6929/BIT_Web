<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드(ex01_fileup.jsp)</title>
<script>
	function file_up(frm) {
		frm.action = "ex01_result.jsp";
		frm.submit();
	}
</script>
</head>
<body>
<%--
	파일업로드 : cos.jar (http://www.servlets.com/cos) 다운로드	
	1. form 태그 : enctype="multipart/form-data" 설정
	2. form 태그 : method="post" 설정
	3. input 태그 : <input type="file" .. > 
	     (input태그의 type에 file 설정)
--%>	
	<form method="post" enctype="multipart/form-data">
		<p>올린사람 : <input type="text" name="name"></p>
		<p>파일제목 : <input type="text" name="title"></p>
		<p>파일 : <input type="file" name="f_name"></p>
		<input type="button" value="파일업로드"
			onclick="file_up(this.form)">
	</form>

</body>
</html>







