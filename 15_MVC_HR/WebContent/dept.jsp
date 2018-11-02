<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서검색</title>
<script>
	function dept_search(frm) {
		frm.action = "deptList";
		frm.submit();
	}
</script>
</head>
<body>
	<h2>부서코드로 검색(dept.jsp)</h2>
	<form method="post">
		부서코드 : <input type="text" name="dept_no">
		<input type="button" value="부서코드로 검색" onclick="dept_search(this.form)">
	</form>
	
</body>
</html>